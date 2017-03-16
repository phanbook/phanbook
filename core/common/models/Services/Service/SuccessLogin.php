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

use Phanbook\Models\SuccessLogins;
use Phanbook\Models\Services\Service;
use Phanbook\Models\Services\Exceptions\EntityException;

/**
 * \Phanbook\Models\Services\Service\SuccessLogin
 *
 * @package Phanbook\Models\Services\Service
 */
class SuccessLogin extends Service
{
    /**
     * Create new SuccessLogins with desired attributes.
     *
     * @param array $attributes
     *
     * @return SuccessLogins
     * @throws EntityException
     */
    public function createOrFail(array $attributes)
    {
        $entity = new SuccessLogins($attributes);
        if (!$entity->save()) {
            throw new EntityException($entity, 'SuccessLogins could not be saved.');
        }

        return $entity;
    }
}
