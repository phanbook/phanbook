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

use Phanbook\Forms\ContactForm;
use Phanbook\Badges\Manager as BadgeManager;
use Phanbook\Models\Pages;

/**
 * Class HelpController
 */
class HelpController extends ControllerBase
{
    public function indexAction()
    {
        $this->tag->setTitle($this->escaper->escapeHtml(t('Helps')));
        $this->view->object = Pages::findFirstByKey('help');
    }
    public function rulesAction()
    {
        $this->tag->setTitle($this->escaper->escapeHtml(t('Rules')));
        $this->view->object = Pages::findFirstByKey('rule');
    }

    public function karmaAction()
    {
        $this->tag->setTitle(t('Karma'));
        $this->view->object = Pages::findFirstByKey('karma');
    }

    public function markdownAction()
    {
        $this->tag->setTitle(t('Markdown'));
        $this->view->object = Pages::findFirstByKey('markdown');
    }

    public function votingAction()
    {
        $this->tag->setTitle(t('Vote'));
        $this->view->object = Pages::findFirstByKey('vote');
    }

    public function moderatorsAction()
    {
        $this->tag->setTitle(t('Moderator'));
        $this->view->object = Pages::findFirstByKey('moderator');
    }

    public function aboutAction()
    {
        $this->tag->setTitle(t('About'));
        $this->view->object = Pages::findFirstByKey('about');
    }

    public function contactAction()
    {
        $this->view->form = new ContactForm();
        $this->tag->setTitle($this->escaper->escapeHtml(t('Contact')));
    }

    public function badgesAction()
    {
        $manager = new BadgeManager;
        $this->view->object = $manager->getBadges();
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
