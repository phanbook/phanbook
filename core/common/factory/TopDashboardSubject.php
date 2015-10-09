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
namespace Phanbook\Factory;

use Phanbook\Google\Analytic;

class TopDashboardSubject extends AbstractSubject
{
    /**
     * List observers
     * @var array
     */
    private $observers;

    /**
     *
     * @var mixed
     */
    private $value;

    /**
     *
     * @var string
     */
    private $key;

    public function __construct()
    {
        $this->observers = [];
        $this->value = 0;
        $this->key = "";
    }

    public function attach(TopDashboardInterface $observer)
    {
        $this->observers[] = $observer;
    }
    public function detach(TopDashboardInterface $observer)
    {
        foreach ($this->observers as $okey => $oval) {
            if ($oval == $observer) {
                unset($this->observers[$okey]);
            }
        }
    }
    public function notify()
    {
        foreach ($this->observers as $obs) {
            $obs->update($this);
        }
    }
    public function compareKey($otherKey)
    {
        if ($this->key == $otherKey) {
            return true;
        }
        return false;
    }
    public function getValue()
    {
        return $this->value;
    }
    public function getObservers()
    {
        return $this->observers;
    }
    public function setKey($key)
    {
        $this->key = $key;
    }
    public function setValue($value)
    {
        $this->value = $value;
    }
}
