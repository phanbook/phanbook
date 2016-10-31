<?php

namespace App\Test\Unit\Models\Repositories;

use App\Test\Module\UnitTest;
use Phalcon\Mvc\ModelInterface;
use Phanbook\Models\Repositories\ObjectIdentifier;
use Phanbook\Models\Repositories\AccessorObjectIdentifier;
use Phanbook\Models\Repositories\Exceptions\RuntimeException;

class AccessorObjectIdentifierTest extends UnitTest
{
    /** @var  AccessorObjectIdentifier */
    private $accessor;

    protected function _before()
    {
        parent::_before();

        $this->accessor = new AccessorObjectIdentifier('getId');
    }

    /** @test */
    public function shouldBeAnIdentityAccessor()
    {
        $this->assertInstanceOf(ObjectIdentifier::class, $this->accessor);
    }

    /** @test */
    public function shouldReturnTheRightCallback()
    {
        $obj = $this->getMock(AccessorIdentifiedObject::class);
        $obj->method('getId')->willReturn(4321);

        $id = $this->accessor->getIdentity($obj);
        $this->assertEquals(4321, $id);
    }

    /** @test */
    public function shouldThrowIfMethodDoesNotExist()
    {
        $this->setExpectedException(RuntimeException::class, 'does not have accessor getOtherId');

        $this->accessor = new AccessorObjectIdentifier('getOtherId');

        $obj = $this->getMock(AccessorIdentifiedObject::class);
        $this->accessor->getIdentity($obj);
    }
}

interface AccessorIdentifiedObject extends ModelInterface
{
    public function getId();
}
