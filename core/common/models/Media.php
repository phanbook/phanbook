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
        $this->error = [];
        $this->fileSystem = new MediaFiles();
        $this->constants = new Constants();
    }

    /**
     * Method to set the value of field id
     *
     * @param integer $id
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
     * @param string $username
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
     * @param integer $type
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
     * @param integer $createdAt
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
     * @param string $filename
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
     * @param mixed $parameters
     * @return Media[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
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

    public function getError()
    {
        return $this->error;
    }

    /**
     * Input file for media
     * @param File Object $fileObj File upload by user
     * @return boolean           true if all ok. Otherwise, false
     */
    public function initFile($fileObj)
    {
        $fileExt = $fileObj->getExtension();
        $filesAccept =  $this->constants->mediaAcceptFilesExt();
        if (! in_array($fileExt, $filesAccept)) {
            $this->error[] = $this->constants->mediaFileNotAccept();
            return false;
        }
        $userName = $this->auth->getUsername();
        $year = date("Y");
        $month = date("M");
        $fileName = $fileObj->getName();
        $serverPath = $userName. "/". $year. "/". $month. "/". $fileName;
        $localPath = "/tmp/". $fileObj->getTempName();
        if ($this->fileSystem->uploadFile($localPath, $serverPath)) {
            return true;
        }
        $this->error[] = $this->constants->mediaUploadError();
        return false;
    }
}
