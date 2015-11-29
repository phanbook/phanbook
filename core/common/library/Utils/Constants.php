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
namespace Phanbook\Utils;

class Constants
{
    /**
     * For global
     */
    public function searchPlaceHolder()
    {
        return t("Search something");
    }

    /**
     * For global error
     */
    public function csrfError()
    {
        return t("CSRF validation failed");
    }

    /**
     *  For media feature
     */
    public function mediaTitle()
    {
        return t("Media Library");
    }
    public function mediaUpload()
    {
        return t("Upload");
    }
    public function mediaNotFound()
    {
        return t("You don't have any media's files here. Please upload first!");
    }
    public function mediaAcceptFilesExt()
    {
        return [
            ".jpg", ".png", ".bmp", ".gif", ".sgv",
            ".rar", ".zip", ".doc", ".txt"
        ];
    }
    public function mediaFileNotAccept()
    {
        return t("Can't upload because file type's not allowed");
    }
    public function mediaUploadError()
    {
        return t("An error(s) occured when upload file(s). Please try again later");
    }
}
