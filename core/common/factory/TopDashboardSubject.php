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
    private $observers;
    private $value;
    private $key;

    public function __construct()
    {
        $this->observers = [];
        $this->value = 0;
        $this->key = "";
    }

    public function attach(TopDashboardInterface $observer_in)
    {
        $this->observers[] = $observer_in;
    }
    public function detach(TopDashboardInterface $observer_in)
    {
        foreach ($this->observers as $okey => $oval) {
            if ($oval == $observer_in) {
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
