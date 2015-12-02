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

use \League\Flysystem\Filesystem;
use \League\Flysystem\Adapter\Local as Adapter;

/**
*
*/
class MediaFiles
{
    private $fileSystem;

    public function onConstruct()
    {

    }

    /**
     * Upload file to content/uploads
     * @param  string $localPath  upload path (/tmp/xxx)
     * @param  string $serverPath path to upload
     * @return boolean
     */
    public function uploadFile($localPath, $serverPath)
    {
        $this->fileSystem = new Filesystem(new Adapter(ROOT_DIR. 'content/uploads/'));
        $stream = fopen($localPath, 'r+');
        $status = $this->fileSystem->writeStream($serverPath, $stream);
        unlink($localPath);
        return $status;
    }
}
