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

use Phanbook\Models\Posts;
use Phanbook\Models\Users;

/**
 * Digest
 *
 * Sends a weekly digest to subscribed users
 */
class Digest extends Injectable
{
    protected $transport;

    protected $mailer;

    /**
     * Sends the digest
     */
    public function send()
    {
        $lastMonths = new \DateTime();
        $lastMonths->modify('-6 month');

        $parameters = array(
            'modifiedAt >= ?0 AND digest = "Y" AND notifications <> "N"',
            'bind'  => [$lastMonths->getTimestamp()]
        );

        $users = [];
        foreach (Users::find($parameters) as $user) {
            $toMail= $user->getEmail();
            if ($toMail && strpos($user->email, '@phalconbook') === false) {
                $users[trim($toMail)] = $user->getInforUser();
            }
        }

        $sitename = '[ '. $this->config->application->name . ' Forum ]';

        $subject = 'Top Stories from ' . $sitename . date('d/m/y');
        foreach ($users as $email => $username) {
            try {
                $params = [
                    'username'  => $username,
                    'subject'   => $subject,
                    'posts'     => $this->getData()
                ];
                if (!$this->mail->send($email, 'senddigest', $params)) {
                    var_dump('send disgest email false');
                }
            } catch (\Exception $e) {
                echo $e->getMessage(), PHP_EOL;
            }
        }
    }

    public function getData()
    {
        $lastWeek = new \DateTime();
        $lastWeek->modify('-1 week');
        $parameters = [
            'createdAt >= ?0 AND deleted != 1',
            'bind'  => [$lastWeek->getTimestamp()],
            'order' => 'numberViews',
            'limit' => 10
        ];
        $url   = $this->config->application->publicUrl;
        $posts = [];
        foreach (Posts::find($parameters) as $post) {
            $user = $post->user;
            if ($user == false) {
                continue;
            }
            $title   = $post->getTitle();
            $content = substr($this->markdown->text($post->getContent()), 0, 200);
            $link = $url . '/posts/' . $post->getId() . '/' . $post->getSlug();
            $posts[] = [
                'link'      => $link,
                'title'     => $title,
                'content'   => strip_tags($content)
            ];
        }
        return $posts;
    }
}
