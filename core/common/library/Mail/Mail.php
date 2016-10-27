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
namespace Phanbook\Mail;

use Swift_Mailer;
use Swift_Message;
use Phalcon\Mvc\View;
use Swift_SmtpTransport;
use Phanbook\Models\Template;
use Phalcon\Mvc\User\Component;

class Mail extends Component
{
    protected $transport;

    protected $template;

    private function getTemplate($key, $params)
    {
        if ($key != 'test' && !$this->template = Template::findFirstByKey($key)) {
            return false;
        }

        if ($key != 'test' && empty($params['subject'])) {
            $params['subject'] = $this->template->getSubject();
        }
        //Set views layout
        $this->view->setViewsDir(app_path('core/data/'));
        $render = $this->view->getRender(
            rtrim($this->config->mail->templatesDir, '/'),
            $key,
            $params,
            function ($view) {
                $view->setRenderLevel(View::LEVEL_LAYOUT);
            }
        );
        if (!empty($render)) {
            return $render;
        }
        //When use template for cli
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
            d('You need to create templates email in database');
            return false;
        }

        if (empty($this->template)) {
            $subject = 'Phanbook - TEST';
        } elseif (empty($params['subject'])) {
            $subject = $this->template->getSubject();
        } else {
            $subject = $params['subject'];
        }

        // Create the message
        $message = Swift_Message::newInstance()
            ->setSubject($subject)
            ->setTo($to)
            ->setFrom([$this->config->mail->fromEmail => $this->config->mail->fromName])
            ->setBody($body, 'text/html');
        if (!$this->transport) {
            $this->transport = Swift_SmtpTransport::newInstance(
                $this->config->mail->smtp->server,
                $this->config->mail->smtp->port
            )
                ->setUsername($this->config->mail->smtp->username)
                ->setPassword($this->config->mail->smtp->password);
        }

        $mailer = Swift_Mailer::newInstance($this->transport);
        return $mailer->send($message);
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
