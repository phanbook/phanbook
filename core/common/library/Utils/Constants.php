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
    public static function declareGlobalVariable()
    {
        /**
         * For global
        */
        define("SEARCH_PLACE_HOLDER", t("Search something"));

        /**
         * For global success message
         * @return String message
        */
        define("SUCCESS_MESSAGE", t("Success"));

        /**
         * For global error message
        */
        define("CSRF_ERROR", t("CSRF validation failed"));

        /**
         *  For media feature
        */
        define("MEDIA_TITLE", t("Media Library"));

        define("MEDIA_UPLOAD", t("Upload"));

        define("MEDIA_NOT_FOUND", t("You don't have any media's files here. Please upload first!"));

        define("MEDIA_FILE_NOT_ACCEPT", t("Can't upload because file type's not allowed"));

        define("MEDIA_TEMP_NOT_FOUND", t("Can't find temp file for upload. This maybe caused by server configure"));

        define("MEDIA_UPLOAD_ERROR", t("An error(s) occured when uploading file(s). Please try again later"));

        define("MEDIA_UPLOAD_THUMB_ERROR", t("Can't create thumb file for image upload"));

        define("MEDIA_ALREADY_EXISTS", t("An error(s) occured when uploading file(s), Another file have same name with this file. Please change file name before upload"));

        define("MAX_WIDTH_THUMB", 200);

        define("MAX_HEIGHT_THUMB", 200);
    }
}
