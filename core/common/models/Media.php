<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Models;

use Phalcon\Http\Request\File;
use Phanbook\Media\MediaFiles;
use Phanbook\Media\MediaType;

class Media extends ModelBase
{
    const MAX_WIDTH_THUMB = 200;
    const MAX_HEIGHT_THUMB = 200;

    const IMAGE_TYPE = 'image';
    const VIDEO_TYPE = 'video';
    //Such as pdf, docs, xls
    const DOCUMENT_TYPE   = 'document';

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $userId;

    /**
     *
     * @var integer
     */
    protected $createdAt;

    /**
     * @var string
     */
    //protected $type;

    /**
     *
     * @var string
     */
    protected $metaFile;

    /**
     * store error
     * @var array
     */
    protected $error;

    /**
     * @var object MediaFiles
     */
    protected $fileSystem;


    public function initialize()
    {
        parent::initialize();
        $this->error = [];
        $this->fileSystem = new MediaFiles();
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
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
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
     * @param string $userId
     */
    public function setUserId($userId)
    {
        $this->userId = $userId;
        return $this;
    }

    /**
     * @return string
     */
    public function getUserId()
    {
        return $this->userId;
    }

    /**
     * @param string $metaFile
     */
    public function setMetaFile($metaFile)
    {
        if (is_array($metaFile)) {
            $metaFile = serialize($metaFile);
        }
        $this->metaFile = $metaFile;
    }

    /**
     * @return string
     */
    public function getMetaFile()
    {
        if (container('phanbook')->text()->isSerialized($this->metaFile)) {
            return unserialize($this->metaFile);
        }
        return $this->metaFile;
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
            'id'        => 'id',
            'userId'    => 'userId',
            'metaFile'  => 'metaFile',
            'createdAt' => 'createdAt',
        );
    }
    /**
     * Get an error if occurred
     * @return array
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
     * @param File $fileObj
     * @return bool true if all ok. Otherwise, false
     * @internal param Object $File $fileObj File upload by user
     */
    public function initFile(File $fileObj)
    {
        $fileExt     = $fileObj->getRealType();
        $mediaType   = new MediaType();

        // Check if file extension's allowed
        if (!$mediaType->checkExtension($fileExt)) {
            return $this->setError(t("Can't upload because file type's not allowed"). ": ". $fileExt);
        }

        // generate path of file
        $key = date('Y/m/') .  $fileObj->getName();
        $serverPath = content_path('uploads/' . $key);
        $localPath = $fileObj->getTempName();

        if (!file_exists($localPath)) {
            return $this->setError(t("Can't find temp file for upload. This maybe caused by server configure"));
        }
        if ($this->fileSystem->checkFileExists($serverPath)) {
            return $this->setError(
                t(
                    'An error(s) occurred when uploading file(s), ' .
                    'Another file have same name with this file. Please change file name before upload'
                )
            );
        }

        if (!$this->fileSystem->uploadFile($localPath, $key, $fileObj->getExtension())) {
            return $this->setError(t("Can't find temp file for upload. This maybe caused by server configure"));
        }
        $meta['type'] = null;
        if ($mediaType->imageCheck($fileExt)) {
            $meta['type'] = self::IMAGE_TYPE;
            //@TODO add thumbnail
        }
        $meta['title'] = $fileObj->getName();
        $meta['file']  = $key;
        $uploadStatus = $this->saveToDB($meta);
        if (!$uploadStatus) {
            return $this->setError(t("An error(s) occurred when uploading file(s). Please try again later"));
        }
        return true;
    }
    public function beforeSave()
    {
        $this->userId = container('auth')->getUserId();
        $this->createdAt = time();
    }

    /**
     * @param $key
     * @return bool
     */
    public function saveToDB($key)
    {
        $media = new Media();
        $media->setMetaFile($key);
        if (!$media->save()) {
            return false;
        }
        return true;
    }
}
