<?php

namespace App\Test\Unit\Models\Services;

use App\Test\Module\UnitTest;
use Phanbook\Models\Users as Entity;
use Phanbook\Models\Services\Service\User;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

class UserTest extends UnitTest
{
    /** @test */
    public function shouldFindUserByEmail()
    {
        $userService = new User();

        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
        ];

        $this->tester->haveInDatabase('users', $data);
        $this->assertInstanceOf(Entity::class, $userService->findFirstByEmail($data['email']));
    }

    /** @test */
    public function shouldFindUserById()
    {
        $userService = new User();

        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
        ];

        $id = $this->tester->haveInDatabase('users', $data);
        $this->assertInstanceOf(Entity::class, $userService->findFirstById($id));
    }

    /** @test */
    public function shouldGetUserByEmail()
    {
        $userService = new User();

        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
        ];

        $this->tester->haveInDatabase('users', $data);
        $this->assertInstanceOf(Entity::class, $userService->findFirstByEmail($data['email']));
    }

    /** @test */
    public function shouldGetUserById()
    {
        $userService = new User();

        $data = [
            'username'  => $this->faker->userName,
            'firstname' => $this->faker->name,
            'lastname'  => $this->faker->name,
            'email'     => $this->faker->email,
            'bio'       => $this->faker->paragraph,
            'birthdate' => $this->faker->date(),
        ];

        $id = $this->tester->haveInDatabase('users', $data);
        $this->assertInstanceOf(Entity::class, $userService->findFirstById($id));
    }

    /**
     * @test
     * @dataProvider providerInvalidId
     * @param mixed $id
     */
    public function shouldThrowExpectedExceptionInCaseOfGetNonExistentEntityById($id)
    {
        $userService = new User();

        $this->tester->dontSeeInDatabase('users', ['id' => $id]);
        $this->tester->expectException(
            new EntityNotFoundException($id),
            function () use ($userService, $id) {
                $userService->getFirstById($id);
            }
        );
    }

    /**
     * @test
     * @dataProvider providerInvalidId
     * @param mixed $id
     */
    public function shouldThrowExpectedExceptionInCaseOfGetNonExistentEntityByEmail($id)
    {
        $userService = new User();

        $this->tester->dontSeeInDatabase('users', ['email' => $id]);
        $this->tester->expectException(
            new EntityNotFoundException($id, 'email'),
            function () use ($userService, $id) {
                $userService->getFirstByEmail($id);
            }
        );
    }

    public function providerInvalidId()
    {
        return [
            [-1],
            [1000000000],
            [null],
            ['non-existent@email.here'],
            [''],
        ];
    }
}
