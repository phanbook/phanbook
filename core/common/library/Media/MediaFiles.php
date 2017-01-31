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
namespace Phanbook\Media;

/**
 * \Phanbook\Media\MediaFiles
 *
 * @package Phanbook\Media
 */
class MediaFiles
{
    /**
     * @var \League\Flysystem\FilesystemInterface
     */
    private $fileSystem;

    public function __construct()
    {
        $this->fileSystem = container('filesystem');
    }

    /**
     * Upload file to content/uploads
     * @param  string $localPath  upload path (/tmp/xxx)
     * @param  string $serverPath path to upload
     * @return boolean
     */
    public function uploadFile($localPath, $serverPath)
    {
        $stream = fopen($localPath, 'r+');
        $status = $this->fileSystem->writeStream($serverPath, $stream);

        return $status;
    }

    /**
     * Looking given file is already on server or not
     * @param  String $serverPath
     * @return boolean
     */
    public function checkFileExists($serverPath)
    {
        return $this->fileSystem->has($serverPath);
    }

    /**
     * Get content of analytic file for each user
     * @param  String $userName
     * @return array
     */
    public function getConfigFile($userName)
    {
        $filename = $userName. "/userConfig.json";
        if (!$this->fileSystem->has($filename)) {
            return [];
        }

        $contents = $this->fileSystem->read($filename);
        return json_decode($contents, true);
    }

    /**
     * Save after modify content of analytic file
     * @param  String $userName
     * @param  array $arrayConfig
     * @return boolean
     */
    public function saveConfigFile($userName, $arrayConfig)
    {
        $filename = $userName. DIRECTORY_SEPARATOR . 'userConfig.json';

        if (!$this->fileSystem->has($filename)) {
            $this->fileSystem->write($filename, '[]');
        }

        $contents = $this->fileSystem->read($filename);
        $result = array_merge(json_decode($contents, true), $arrayConfig);
        $result = json_encode($result);

        if (!$this->fileSystem->update($filename, $result)) {
            return false;
        }
        return true;
    }
}
