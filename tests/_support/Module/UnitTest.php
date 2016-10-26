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

namespace App\Test\Module;

use UnitTester;
use Phalcon\DiInterface;
use Codeception\Test\Unit;
use PHPUnit_Runner_Version;

class UnitTest extends Unit
{
    /**
     * UnitTester Object
     * @var UnitTester
     */
    protected $tester;

    /**
     * @var DiInterface
     */
    protected $di;

    protected function _before()
    {
        /** @var \Phalcon\Mvc\Application $app */
        $app = $this->getModule('Phalcon')->getApplication();
        $this->di = $app->getDI();
    }

    /**
     * @return UnitTester
     */
    public function getTester()
    {
        return $this->tester;
    }

    /**
     * @return DiInterface
     */
    public function getDI()
    {
        return $this->di;
    }

    public function setExpectedException($exception, $message = '', $code = null)
    {
        if (!method_exists(PHPUnit_Runner_Version::class, 'id') ||
            version_compare(PHPUnit_Runner_Version::id(), '5.2.0', '<')) {
            parent::setExpectedException($exception, $message, $code);
        } else {
            $this->expectException($exception);
            if ($message !== null && $message !== '') {
                $this->expectExceptionMessage($message);
            }
            if ($code !== null) {
                $this->expectExceptionCode($code);
            }
        }
    }
}
