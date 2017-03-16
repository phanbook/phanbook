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

/**
 * \Phanbook\Models\Services\Exceptions\EntityNotFoundException
 *
 * @package Phanbook\Models\Services\Exceptions
 */
class EntityNotFoundException extends Exception implements ServiceExceptionInterface
{
    /**
     * @var string
     */
    protected $id;

    /**
     * EntityNotFoundException constructor.
     *
     * @param string         $id
     * @param string         $type
     * @param int            $code
     * @param Exception|null $previous
     */
    public function __construct($id, $type = 'id', $code = 0, Exception $previous = null)
    {
        $this->id = $id;

        parent::__construct(
            sprintf('No entity found for %s "%s"', $type, $this->getId()),
            $code,
            $previous
        );
    }

    /**
     * Get the ID which was not found.
     *
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }
}
