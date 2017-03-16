<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Models\Services\Exceptions;

use Exception;
use Phalcon\Mvc\ModelInterface;

/**
 * \Phanbook\Models\Services\Exceptions\EntityException
 *
 * @package Phanbook\Models\Services\Exceptions
 */
class EntityException extends Exception implements ServiceExceptionInterface
{
    /**
     * @var ModelInterface
     */
    protected $entity;

    /**
     * EntityNotFoundException constructor.
     *
     * @param ModelInterface $entity
     * @param string         $message
     * @param string         $type
     * @param int            $code
     * @param Exception|null $prev
     */
    public function __construct(ModelInterface $entity, $message = '', $type = 'id', $code = 0, Exception $prev = null)
    {
        $this->entity = $entity;

        $messages = [];
        foreach ((array) $entity->getMessages() as $entityMessage) {
            $messages[] = (string) $entityMessage;
        }

        array_unshift($messages, $message);

        $message = implode('. ', array_map(function ($value) {
            return rtrim($value, '.');
        }, $messages));

        parent::__construct($message, $code, $prev);
    }

    /**
     * Get the entity associated with exception.
     *
     * @return ModelInterface
     */
    public function getEntity()
    {
        return $this->entity;
    }
}
