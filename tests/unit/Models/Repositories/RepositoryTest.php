<?php

namespace App\Test\Unit\Models\Repositories;

use Faker\Factory as Faker;
use App\Test\Module\UnitTest;
use Phanbook\Models\Users as UserEntity;
use Phanbook\Models\Repositories\Repository;
use Phanbook\Models\Repositories\AccessorObjectIdentifier;

class RepositoryTest extends UnitTest
{
    /** @var  \Faker\Generator */
    protected $faker;

    protected function _before()
    {
        parent::_before();

        $this->faker = Faker::create();
    }

    /** @test */
    public function shouldBeAbleToSaveAndRetrieveObjectLater()
    {
        $objectId = $this->faker->numberBetween(1);
        $objectToPersist = new UserEntity([
            'id'   => $objectId,
            'name' => $this->faker->userName
        ]);

        $repository = $this->createRepository();
        $repository->save($objectToPersist);

        $this->assertEquals($objectToPersist, $repository->findById($objectId));
        $this->assertInstanceOf(UserEntity::class, $repository->findById($objectId));
    }

    /** @test */
    public function shouldBeAbleToSaveAndRetrieveObjectsWithIDAsValueObject()
    {
        $objectId = (object) $this->faker->numberBetween(1);
        $objectToPersist = new UserEntity([
            'id'   => $objectId,
            'name' => $this->faker->userName
        ]);

        $repository = $this->createRepository();
        $repository->save($objectToPersist);

        $this->assertEquals($objectToPersist, $repository->findById($objectId));
        $this->assertInstanceOf(UserEntity::class, $repository->findById($objectId));
    }

    /** @test */
    public function shouldOverrideObjectsWithTheSameId()
    {
        $objectId = $this->faker->numberBetween(1);

        $objectsToPersist = [
            new UserEntity([
                'id'   => $objectId,
                'name' => $this->faker->userAgent
            ]),
            new UserEntity([
                'id'   => $objectId,
                'name' => $this->faker->userName
            ])
        ];

        $repository = $this->createRepository();

        $repository->save($objectsToPersist[0]);
        $repository->save($objectsToPersist[1]);

        $this->assertEquals($objectsToPersist[1], $repository->findById($objectId));
    }

    /** @test */
    public function shouldBeAbleToRemoveObject()
    {
        $objectId = $this->faker->numberBetween(1);
        $objectToPersist = new UserEntity([
            'id'   => $objectId,
            'name' => $this->faker->userName
        ]);

        $repository = $this->createRepository();

        $repository->save($objectToPersist);
        $repository->remove($objectToPersist);

        $this->assertNull($repository->findById($objectId));
    }

    /** @test */
    public function shouldDoNothingWhenAskedToRemoveUnstoredObject()
    {
        $objectId = $this->faker->numberBetween(1);
        $objectToPersist = new UserEntity([
            'id'   => $objectId,
            'name' => $this->faker->userName
        ]);

        $repository = $this->createRepository();

        $repository->remove($objectToPersist);

        $this->assertEquals([], $repository->getAll());
    }

    /** @test */
    public function shouldBeAbleToGetAllObjects()
    {
        $objectId1 = $this->faker->numberBetween(1);
        $objectId2 = $this->faker->numberBetween(1);

        $objectsToPersist = [
            new UserEntity([
                'id'   => $objectId1,
                'name' => $this->faker->userAgent
            ]),
            new UserEntity([
                'id'   => $objectId2,
                'name' => $this->faker->userName
            ])
        ];

        $repository = $this->createRepository();

        $repository->save($objectsToPersist[0]);
        $repository->save($objectsToPersist[1]);

        $this->assertEquals($objectsToPersist, $repository->getAll());
    }

    /** @test */
    public function shouldBeAbleToClearRepository()
    {
        $objectId1 = $this->faker->numberBetween(1);
        $objectId2 = $this->faker->numberBetween(1);

        $objectsToPersist = [
            new UserEntity([
                'id'   => $objectId1,
                'name' => $this->faker->userAgent
            ]),
            new UserEntity([
                'id'   => $objectId2,
                'name' => $this->faker->userName
            ])
        ];

        $repository = $this->createRepository();

        $repository->save($objectsToPersist[0]);
        $repository->save($objectsToPersist[1]);

        $repository->clear();
        $this->assertEquals([], $repository->getAll());
    }

    private function createRepository()
    {
        return new Repository(new AccessorObjectIdentifier('getId'));
    }
}
