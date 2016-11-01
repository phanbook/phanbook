<?php

namespace App\Test\Fixtures\Models\Repositories;

use Phalcon\Mvc\ModelInterface;

interface AccessorIdentifiedObject extends ModelInterface
{
    public function getId();
}
