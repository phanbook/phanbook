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
 * \Phanbook\Media\MediaType
 *
 * @package Phanbook\Media
 */
class MediaType
{
    public $imageTypes = [
        'image/gif',
        'image/jpg',
        'image/png',
        'image/bmp',
        'image/jpeg'
    ];
    public $videoTypes = [
        'video/mp3',
        'video/mp4'
    ];

    public $documentTypes  = [
        'text/plain',
        'application/pdf'
    ];
    /**
     * Attempt to determine the real file type of a file.
     *
     * @param string $extension Extension (eg 'jpg')
     *
     * @return boolean
     */
    public function imageCheck($extension)
    {
        $allowedTypes = $this->imageTypes;
        return in_array($extension, $allowedTypes);
    }

    /**
     * @param $extension
     * @return bool
     */
    public function videoCheck($extension)
    {
        $allowedTypes = $this->videoTypes;
        return in_array($extension, $allowedTypes);
    }

    /**
     * get file extension allowed for upload from db
     * @return array
     */
    public function getExtensionAllowed()
    {
        return array_merge($this->imageTypes, $this->videoTypes, $this->documentTypes);
    }

    public function checkExtension($extension)
    {
        $allowedTypes = $this->getExtensionAllowed();
        return in_array($extension, $allowedTypes);
    }
}
