<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
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
     * @param Exception|null $previous
     */
    public function __construct($entity, $message = '', $type = 'id', $code = 0, Exception $previous = null)
    {
        $this->entity = $entity;

        $messages = [];
        foreach ($entity->getMessages() as $message) {
            $messages[] = (string) $message;
        }

        $message .= implode(' ', $messages);

        parent::__construct($message, $code, $previous);
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
