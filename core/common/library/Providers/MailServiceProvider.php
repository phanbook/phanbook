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
namespace Phanbook\Common\Library\Providers;

use Swift_Mailer;
use Phalcon\Config;
use Phanbook\Mail\Mail;
use Swift_SmtpTransport;

/**
 * \Phanbook\Common\Library\Providers\MailServiceProvider
 *
 * @package Phanbook\Common\Library\Providers
 */
class MailServiceProvider extends AbstractServiceProvider
{
    /**
     * The Service name.
     * @var string
     */
    protected $serviceName = 'mail';

    /**
     * {@inheritdoc}
     *
     * @return void
     */
    public function register()
    {
        $this->di->setShared(
            $this->serviceName,
            function () {
                /**
                 * @var \Phalcon\DiInterface $this
                 * @var \Phalcon\Config $config
                 */
                $config = $this->getShared('config');

                if (!$config->offsetExists('mail') || !$config->get('mail') instanceof Config) {
                    trigger_error('Unable to get mail config.', E_USER_ERROR);
                }

                $mail = new Mail($this);
                $config = $config->get('mail');

                $transport = Swift_SmtpTransport::newInstance($config->get('smtp')->server, $config->get('smtp')->port);

                $transport->setUsername($config->get('smtp')->get('username'));
                $transport->setPassword($config->get('smtp')->get('password'));

                $mailer = new Swift_Mailer($transport);

                $mail->setDI($this);
                $mail->setEventsManager($this->getShared('eventsManager'));

                $mail->setMailer($mailer);

                return $mail;
            }
        );
    }
}
