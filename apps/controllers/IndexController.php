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
namespace Phanbook\Controllers;

/**
 * Class IndexController
 */
class IndexController extends ControllerBase
{
    public function indexAction()
    {
    }
    /**
     * @todo
     *
     * Change the language, reload translations if needed
     * Default language en_US
     */
    public function setLanguageAction($language = '')
    {
        //set default language to config.php
        $language = $this->config->language;
        if ($language == 'en_US' || $language == 'de_DE') {
            $this->session->set('language', $language);
        }
        //Go to the last place
        $referer = $this->request->getHTTPReferer();
        if (strpos($referer, $this->request->getHttpHost()."/")!==false) {
            return $this->response->setHeader("Location", $referer);
        } else {
            return $this->response->redirect();
        }
    }
}
