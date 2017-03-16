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
namespace Phanbook\Mail;

use Swift_Mailer;
use Swift_Message;
use LogicException;
use Phalcon\Mvc\View;
use Phalcon\DiInterface;
use Phanbook\Models\Template;
use Phalcon\Mvc\User\Component;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;

/**
 * \Phanbook\Mail\Mail
 *
 * @package Phanbook\Mail
 */
class Mail extends Component
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * @var Swift_Mailer
     */
    protected $mailer;

    protected $template;

    /**
     * Mail constructor.
     *
     * @param DiInterface|null $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->injectDi($di);
    }

    private function getTemplate($key, $params)
    {

        $this->template = Template::findFirstByKey($key);

        // Set views layout
        $this->view->setViewsDir(app_path('core/data/'));
        $render = $this->view->getRender(
            rtrim($this->getConfig()->get('mail')->templatesDir, '/'),
            $key,
            $params,
            function ($view) {
                $view->setRenderLevel(View::LEVEL_LAYOUT);
            }
        );

        if (!empty($render)) {
            return $render;
        }

        // When use template for cli
        return $this->view->getContent();
    }

    /**
     * Send email
     *
     * @param string $to Email to send
     * @param string $templateKey A unique key of the template
     * @param array $params Array with params for template. If $params['subject'] not set we get subject from database
     *
     * @return int
     */
    public function send($to, $templateKey, $params = [])
    {
        $body = $this->getTemplate($templateKey, $params);

        if (!$body) {
            throw new LogicException('You need to create templates email in database');
        }

        if (!$this->getConfig()->offsetExists('mail') || empty($this->getConfig()->get('mail'))) {
            $this->getLogger()->error('Unable to get mail config. Exit...');
            return 0;
        }

        $config = $this->getConfig()->get('mail');

        if (empty($this->template)) {
            $subject = $config->get('fromName');
        } elseif (empty($params['subject'])) {
            $subject = $this->template->getSubject();
        } else {
            $subject = $params['subject'];
        }

        try {
            $message = Swift_Message::newInstance()
                ->setSubject($subject)
                ->setTo($to)
                ->setFrom([$config->get('fromEmail') => $config->get('fromName')])
                ->setBody($body, 'text/html');

            $failedRecipients = [];
            $sent = $this->mailer->send($message, $failedRecipients);

            if (!empty($failedRecipients)) {
                $this->getLogger()->error('Unable to sent mail for: ' . implode(', ', $failedRecipients));
            }

            return $sent;
        } catch (\Exception $e) {
            $this->getLogger($e->getMessage());

            return 0;
        }
    }

    /**
     * @param  Swift_Mailer $mailer
     * @return $this
     */
    public function setMailer(Swift_Mailer $mailer)
    {
        $this->mailer = $mailer;

        return $this;
    }

    /**
     * Send a test email
     *
     * @param $to
     *
     * @return int
     */
    public function sendTest($to)
    {
        return $this->send($to, 'test');
    }

    /**
     * Send a test email
     *
     * @param $to
     *
     * @return int
     */
    public function getToMailTest($to)
    {
        return $to;
    }

    public function renderTest()
    {

        return $this->getTemplate('test', []);
    }
}
