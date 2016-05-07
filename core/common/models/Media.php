<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Models;

use Phanbook\Media\MediaFiles;
use Phanbook\Utils\Constants;
use Phalcon\Image\Adapter\GD;

class Media extends ModelBase
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $username;

    /**
     *
     * @var integer
     */
    protected $type;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     *
     * @var string
     */
    protected $filename;

    /**
     * store error
     * @var list
     */
    protected $error;

    /**
     * [Object of flysystem, manager files]
     * @var [flysystem]
     */
    protected $fileSystem;

    /**
     * Constructer
     */
    protected $constants;
    public function initialize()
    {
        parent::initialize();
        $this->error = [];
        $this->fileSystem = new MediaFiles();
        $this->constants = new Constants();
    }

    /**
     * Method to set the value of field id
     *
     * @param  integer $id
     * @return $this
     */

    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field username
     *
     * @param  string $username
     * @return $this
     */
    public function setUsername($username)
    {
        $this->username = $username;

        return $this;
    }

    /**
     * Method to set the value of field type
     *
     * @param  integer $type
     * @return $this
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Method to set the value of field createdAt
     *
     * @param  integer $createdAt
     * @return $this
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Method to set the value of field filename
     *
     * @param  string $filename
     * @return $this
     */
    public function setFilename($filename)
    {
        $this->filename = $filename;

        return $this;
    }

    /**
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field username
     *
     * @return string
     */
    public function getUsername()
    {
        return $this->username;
    }

    /**
     * Returns the value of field type
     *
     * @return integer
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Returns the value of field createdAt
     *
     * @return integer
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Returns the value of field filename
     *
     * @return string
     */
    public function getFilename()
    {
        return $this->filename;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'media';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Media[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Media
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     * Keys are the real names in the table and the values their names in the application
     *
     * @return array
     */
    public function columnMap()
    {
        return array(
            'id' => 'id',
            'username' => 'username',
            'type' => 'type',
            'createdAt' => 'createdAt',
            'filename' => 'filename'
        );
    }
    /**
     * Get an error if occured
     * @return list string List error
     */
    public function getError()
    {
        return $this->error;
    }

    private function setError($error)
    {
        $this->error[] = $error;
        return false;
    }

    /**
     * Input file for media, using for upload file
     * @param File Object $fileObj File upload by user
     * @return boolean           true if all ok. Otherwise, false
     */
    public function initFile($fileObj)
    {
        $fileExt     = $fileObj->getExtension();
        $filesAccept =  MediaType::getExtensionAllowed();

        // Check if file extension's allowed
        if (!in_array($fileExt, $filesAccept)) {
            return $this->setError(MEDIA_FILE_NOT_ACCEPT. ": ". $fileExt);
        }
         // determine directory for this file. <username>/<file type>/<year>/<month>/<filename>
        $userName = $this->getDI()->getAuth()->getUsername();
        $year     = date("Y");
        $month    = date("M");
        $fileName = $fileObj->getName();
        $fileType = MediaType::getTypeFromExt($fileExt);

        // generate path of file
        $serverPath = $userName. DS. $fileType->getName(). DS. $year. DS. $month. DS. $fileName;
        $localPath = $fileObj->getTempName();

        if (!file_exists($localPath)) {
            return $this->setError(MEDIA_TEMP_NOT_FOUND);
        }
        if ($this->fileSystem->checkFileExists($serverPath)) {
            return $this->setError(MEDIA_ALREADY_EXISTS);
        }
        if (!$this->fileSystem->uploadFile($localPath, $serverPath)) {
            return $this->setError(MEDIA_TEMP_NOT_FOUND);

        }
        $uploadStatus = $this->saveToDB(
            $userName,
            $fileType->getId(),
            time(),
            $fileName
        );
        if (!$uploadStatus) {
            return $this->setError(MEDIA_UPLOAD_ERROR);
        }
        // Update analytic file
        $config        = $this->fileSystem->getConfigFile($userName);
        $defaultConfig = MediaType::getConfig();
        $config        = array_merge($defaultConfig, $config);
        $config[$fileType->getName()] ++;

        $this->fileSystem->saveConfigFile($userName, $config);
        if ($fileType->getName() == "Images") {
            $this->generateThumb($localPath, $serverPath);
        }
        return true;
    }
    /**
     * Generate thumb file for image.
     * The thumb file has same type with original file. However it have small resolution and name has thumb_ prefix
     * @param  string $localPath
     * @return boolean
     */
    public function generateThumb($localPath, $serverPath)
    {
        $maxWidth = MAX_WIDTH_THUMB;
        $maxHeight = MAX_HEIGHT_THUMB;
        $thumbServerPath = dirname($serverPath) . DS . "thumb_" . DS . basename($serverPath);
        $thumbLocalPath = $localPath. "_thumb";
        $resizeStatus = $this->resizeImage($localPath, $thumbLocalPath, $maxWidth, $maxHeight);
        if ($resizeStatus) {
            $uploadStatus = $this->fileSystem->uploadFile($thumbLocalPath, $thumbServerPath);
            if ($uploadStatus) {
                return true;
            }
        }
        return false;
    }
    /**
     * Resize of image uploaded
     * @param  string  $source
     * @param  string  $dest
     * @param  integer $new_width
     * @param  integer $new_height
     * @return   boolean
     */
    private function resizeImage($source, $dest, $new_width, $new_height)
    {
        $image = new GD($source);
        $source_height = $image->getHeight();
        $source_width = $image->getWidth();
        $source_aspect_ratio = $source_width / $source_height;
        $desired_aspect_ratio = $new_width / $new_height;
        if ($source_aspect_ratio > $desired_aspect_ratio) {
            $temp_height = $new_height;
            $temp_width = ( int ) ($new_height * $source_aspect_ratio);
        } else {
            $temp_width = $new_width;
            $temp_height = ( int ) ($new_width / $source_aspect_ratio);
        }
        $x0 = ($temp_width - $new_width) / 2;
        $y0 = ($temp_height - $new_height) / 2;
        $image->resize($temp_width, $temp_height)->crop($new_width, $new_height, $x0, $y0);
        return $image->save($dest);
    }
    /**
     * Save file info uploaded to database
     * @param  string $userName
     * @param  id     $type
     * @param  time   $createdAt
     * @param  string $filename
     * @return boolean
     */
    public function saveToDB($userName, $type, $createdAt, $filename)
    {
        $media = new Media();
        $media->setFilename($filename);
        $media->setType($type);
        $media->setUsername($userName);
        $media->setCreatedAt($createdAt);
        if ($media->save()) {
            return true;
        }
        return false;
    }
}
