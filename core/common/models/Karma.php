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
namespace Phanbook\Models;

/**
 * Karma constants
 */
abstract class Karma
{
    const INITIAL_KARMA = 45;

    const LOGIN = 5;

    const ADD_NEW_POST = 10;

    const ADD_NEW_POST_HACKERNEWS = 5;

    const DELETE_POST = 15;

    const SOMEONE_REPLIED_TO_MY_POST = 5;

    const REPLY_ON_SOMEONE_ELSE_POST = 10;

    const SOMEONE_DELETED_HIS_OR_HER_REPLY_ON_MY_POST = 5;

    const DELETE_REPLY_ON_SOMEONE_ELSE_POST = 10;

    const MODERATE_POST = 25;

    const MODERATE_REPLY = 25;

    const MODERATE_DELETE_POST = 10;

    const MODERATE_DELETE_REPLY = 10;

    const VISIT_ON_MY_POST = 1;

    const MODERATE_VISIT_POST = 4;

    const VISIT_POST = 2;

    const SOMEONE_DID_VOTE_MY_POST = 5;

    const VOTE_ON_SOMEONE_ELSE_POST = 10;

    const VOTE_UP_ON_MY_REPLY_ON_MY_POST = 15;

    const VOTE_UP_ON_MY_REPLY = 10;

    const VOTE_UP_ON_SOMEONE_ELSE_REPLY = 10;

    const VOTE_DOWN_ON_SOMEONE_ELSE_REPLY = 10;

    const VOTE_DOWN_ON_MY_REPLY_ON_MY_POST = 15;

    const VOTE_DOWN_ON_MY_REPLY = 10;

    const SOMEONE_ELSE_ACCEPT_YOUR_REPLY = 50;
}
