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
    public function uploadFile($localPath, $serverPath, $extension = null)
    {
        if ($this->checkFileExists($serverPath)) {
            $item = explode($extension, $serverPath);
            $serverPath = $item[0] . uniqid() . '.' . $extension;
        }
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
}
