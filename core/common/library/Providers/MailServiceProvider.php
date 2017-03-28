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
namespace Phanbook\Common\Library\Providers;

use Swift_Mailer;
use Phalcon\Config;
use Phanbook\Mail\Mail;
use Swift_SmtpTransport;
use Swift_NullTransport;

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
            'smtpTransport',
            function () {
                /**
                 * @var \Phalcon\DiInterface $this
                 * @var \Phalcon\Config $config
                 */
                $config = $this->getShared('config');

                if (APPLICATION_ENV === ENV_TESTING) {
                    return Swift_NullTransport::newInstance();
                }

                if (!$config->offsetExists('mail') || !$config->get('mail')->smtp instanceof Config) {
                    trigger_error('Unable to get mail config.', E_USER_ERROR);
                }

                $config = $config->get('mail')->smtp;

                $transport = Swift_SmtpTransport::newInstance($config->get('server'), $config->get('port'));

                $transport->setUsername($config->get('username'));
                $transport->setPassword($config->get('password'));

                return $transport;
            }
        );

        $this->di->setShared(
            $this->serviceName,
            function () {
                /** @var \Phalcon\DiInterface $this */
                $smtpTransport = $this->getShared('smtpTransport');

                $mail = new Mail($this);
                $mailer = new Swift_Mailer($smtpTransport);

                $mail->setDI($this);
                $mail->setEventsManager($this->getShared('eventsManager'));

                $mail->setMailer($mailer);

                return $mail;
            }
        );
    }
}
