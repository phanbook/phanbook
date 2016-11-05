<?php

namespace App\Test\Unit\Models\Repositories;

use App\Test\Module\UnitTest;
use Phanbook\Models\Repositories\ObjectIdentifier;
use Phanbook\Models\Repositories\RuntimeException;
use Phanbook\Models\Repositories\AccessorObjectIdentifier;
use App\Test\Fixtures\Models\Repositories\AccessorIdentifiedObject;

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
        $obj = $this->createMock(AccessorIdentifiedObject::class);
        $obj->method('getId')->willReturn(4321);

        $id = $this->accessor->getIdentity($obj);
        $this->assertEquals(4321, $id);
    }

    /** @test */
    public function shouldThrowIfMethodDoesNotExist()
    {
        $this->setExpectedException(RuntimeException::class, 'does not have accessor getOtherId');

        $this->accessor = new AccessorObjectIdentifier('getOtherId');

        $obj = $this->createMock(AccessorIdentifiedObject::class);
        $this->accessor->getIdentity($obj);
    }
}
