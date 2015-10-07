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

use Phalcon\Di\Injectable;

use Phanbook\Models\Notifications;
use Phanbook\Models\Posts;

/**
 * SendSpool
 *
 * Sends e-mails to users in the spool
 */
class SendSpool extends Injectable
{
    protected $transport;

    protected $mailer;

    private function _prerify($text)
    {
        if (preg_match_all('#```([a-z]+)(.+)```([\n\r]+)?#m', $text, $matches, PREG_SET_ORDER)) {
            foreach ($matches as $match) {
                $text = str_replace($match[0], '<pre>' . $match[2] . '</pre>', $text);
            }
        }
        return $text;
    }

    public function send(Notifications $notification)
    {
        if ($notification->getSent() == 'Y') {
            return;
        }
        //Get post and user via relationship ORM
        $post = $notification->post;
        $user = $notification->user;
        if ($notification->getType() != 'P') {
            $reply = $notification->reply;
        } else {
            $reply = true;
        }

        $url      = $this->config->application->publicUrl;
        $sitename = '[ '. $this->config->application->name . 'Forum ]';

        if ($post && $user && $reply) {
            $to = $user->getEmail();
            if ($to && $user->getNotifications() != 'N' && strpos($to, '@phalconbook.com') === false) {
                try {
                    if ($notification->getType() == Notifications::TYPE_POSTS) {
                        $content = $this->markdown->text($post->getContent());
                        $link = $url .'/posts/' .$post->getId(). '/' . $post->getSlug();
                    } else {
                        $reply = $notification->reply;
                        $content = $this->markdown->text($reply->getContent());
                        $link = $url .'/posts/' .$post->getId(). '/' . $post->getSlug() . '#C' . $reply->getId();
                    }
                    $params = [
                        'name' => $user->getInforUser(),
                        'link' => $link,
                        'subject' => $sitename,
                        'content' => strip_tags($content)
                    ];
                    if (!$this->mail->send($to, 'sendspool', $params)) {
                        var_dump('false');
                    }
                } catch (\Exception $e) {
                    echo $e->getMessage(), PHP_EOL;
                }
            }
        }

        $notification->setSent('Y');
        if ($notification->save() == false) {
            foreach ($notification->getMessages() as $message) {
                echo $message->getMessage(), PHP_EOL;
            }
        }
    }

    /**
     * Check notifications marked as not send on the databases and send them
     */
    public function sendRemaining()
    {
        foreach (Notifications::find('sent = "N"') as $notification) {
            $this->send($notification);
        }
    }

    /**
     * Check the queue from Beanstalk and send the notifications scheduled there
     *
     * @see at https://docs.phalconphp.com/en/latest/api/Phalcon_Queue_Beanstalk.html
     */
    public function consumeQueue()
    {
        while (true) {
            while ($this->queue->peekReady() !== false) {
                $job = $this->queue->reserve();

                $message = $job->getBody();
                foreach ($message as $userId => $id) {
                    $notification = Notifications::findFirstById($id);
                    if ($notification) {
                        $this->send($notification);
                    }
                }

                if (is_object($this->transport)) {
                    $this->transport->stop();
                    $this->transport = null;
                    $this->mailer = null;
                }

                $job->delete();
            }

            sleep(5);
        }
    }
}
