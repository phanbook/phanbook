<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Frontend\Controllers;

use Phanbook\Forms\ContactForm;
use Phanbook\Badges\Manager as BadgeManager;
use Phanbook\Models\Pages;

/**
 * Class HelpController
 */
class PagesController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();
        $this->view->pick('page');

    }
    public function indexAction()
    {
      $this->view->page = $this->phanbook->getPageByTitle('About');
    }
    public function rulesAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('Rules');
    }

    public function karmaAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('Karma');
    }

    public function markdownAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('markdown');
    }

    public function votingAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('voting');
    }

    public function moderatorsAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('moderators');
    }

    public function aboutAction()
    {
        $this->view->page = $this->phanbook->getPageByTitle('About');
    }

    public function contactAction()
    {
        $this->view->form = new ContactForm();
        $this->tag->setTitle($this->escaper->escapeHtml(t('Contact')));
    }

    public function badgesAction()
    {
        $manager = new BadgeManager;
        $this->view->page = $manager->getBadges();
        $this->tag->setTitle(t('Badges'));
    }
    /**
     * These are some article hepl
     * @param   string
     * @return  midex
     */
    public function itemAction($item)
    {
        //@ todo later
        $this->indexRedirect();
    }
}
