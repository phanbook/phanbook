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
namespace Phanbook\Models\Services\Service;

use Phalcon\Db\Column;
use Phanbook\Models\FailedLogins;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityException;

/**
 * \Phanbook\Models\Services\Service\FailedLogin
 *
 * @package Phanbook\Models\Services\Service
 */
class FailedLogin extends Service
{
    /**
     * Create new FailedLogins with desired attributes.
     *
     * @param array $attributes
     *
     * @return FailedLogins
     * @throws EntityException
     */
    public function createOrFail(array $attributes)
    {
        $entity = new FailedLogins($attributes);
        if (!$entity->save()) {
            throw new EntityException($entity, 'FailedLogins could not be saved.');
        }

        return $entity;
    }

    /**
     * Count attempts of failed logins.
     *
     * @param string $ipAddress
     * @param int    $fromAttemptedTime
     *
     * @return int
     */
    public function countAttempts($ipAddress, $fromAttemptedTime)
    {
        return (int) FailedLogins::count([
            'condition' => 'ipAddress = :address: AND attempted >= :attempted:',
            'bind' => [
                'address'   => $ipAddress,
                'attempted' => $fromAttemptedTime,
            ],
            'bindTypes' => [
                'address'   => Column::BIND_PARAM_INT,
                'attempted' => Column::BIND_PARAM_INT,
            ],
        ]);
    }
}
