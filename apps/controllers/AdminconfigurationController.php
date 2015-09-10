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

use Phanbook\Models\Configuration;
use Phanbook\Forms\ConfigurationsForm;
use Phalcon\Mvc\View;

/**
 * @extends ControllerBase
 */
class AdminconfigurationController extends ControllerAdminBase
{


    /**
     * indexAction function.
     *
     * @access public
     * @return void
     */
    public function indexAction()
    {
        $this->tag->setTitle(t('General Settings'));
        $this->view->form = new ConfigurationsForm();
    }



    /**
     * Method editAction
     */
    public function editAction($id)
    {
        if (!$object = Configuration::findFirstById($id)) {
            $this->flashSession->error(t('Configuration doesn\'t exist.'));

            return $this->response->redirect('configuration');
        }

        $this->assets->addCss('js/chosen/chosen.css');
        $this->assets->addJs('js/chosen/chosen.jquery.min.js');

        $this->view->configurationForm = new ConfigurationForm($object);
        $this->view->object            = $object;
        $this->view->pick($this->router->getControllerName() . '/item');
    }

    public function saveGeneralAction()
    {
        //Is not $_POST
        if (!$this->request->isPost()) {
            return $this->currentRedirect();
        }
        $filename = ROOT_DIR . 'common/config/options.php';
        $makeFile = \Phanbook\Tools\ZFunction::makeFile($filename);
        if ($makeFile) {
            $name       = $this->request->getPost('name');
            $tagline    = $this->request->getPost('tagline');
            $publicUrl  = $this->request->getPost('publicUrl');

            $data = "<?php return new \Phalcon\Config([
                'application' => [
                    'name'      => '{$name}',
                    'tagline'   => '{$tagline}',
                    'publicUrl' => '{$publicUrl}'
                ],
            ]);";
           if (!file_put_contents($filename, $data)) {

           }
            $this->flashSession->success(t('Data was successfully deleted'));
            return $this->currentRedirect();
        }
        return $this->currentRedirect();

    }

    /**
     * Add new configuration
     */
    public function newAction()
    {
        $this->assets->addCss('js/chosen/chosen.css');
        $this->assets->addJs('js/chosen/chosen.jquery.min.js');

        $this->view->configurationForm = new ConfigurationForm();
        $this->view->pick($this->router->getControllerName() . '/item');
    }
}
