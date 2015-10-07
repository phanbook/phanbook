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

trait MyTimestampable
{

    /**
     * Implements hook beforeUpdate
     *
     * Check permission before updated task
     *
     * @return bool
     */
    public function beforeValidationOnUpdate()
    {

        $this->modifiedAt = time();
    }

    /**
     * Implements hook beforeValidationOnCreate
     *
     * Check permission before updated task
     *
     * @return bool
     */
    public function beforeValidationOnCreate()
    {
        $this->modifiedAt = time();
        $this->createdAt  = time();
    }
    /**
     * Implements hook beforeSave
     *
     * Check permission before updated task
     *
     * @return bool
     */
    public function beforeCreate()
    {
        $this->modifiedAt = time();
        $this->createdAt  = time();
    }

    public function beforeUpdate()
    {

        $this->modifiedAt = time();
    }
}
