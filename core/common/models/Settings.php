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
namespace Phanbook\Models;

class Settings extends ModelBase
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $name;

    /**
     *
     * @var string
     */
    protected $value;

    /**
     *
     * @var string
     */
    protected $note;

    public function initialize()
    {
        \Phalcon\Mvc\Model::setup([
           'notNullValidations' => false
        ]);
    }

    /**
     * Method to set the value of field id
     *
     * @param  integer $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field name
     *
     * @param  string $name
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Method to set the value of field value
     *
     * @param  string $value
     * @return $this
     */
    public function setValue($value)
    {
        $this->value = $value;

        return $this;
    }

    /**
     * Method to set the value of field note
     *
     * @param  string $note
     * @return $this
     */
    public function setNote($note)
    {
        $this->note = $note;

        return $this;
    }

    /**
     * Returns the value of field id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Returns the value of field value
     *
     * @return string
     */
    public function getValue()
    {
        return $this->value;
    }

    /**
     * Returns the value of field note
     *
     * @return string
     */
    public function getNote()
    {
        return $this->note;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'settings';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Settings[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Settings
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    /**
     * Independent Column Mapping.
     * Keys are the real names in the table and the values their names in the application
     *
     * @return array
     */
    public function columnMap()
    {
        return [
            'id' => 'id',
            'name' => 'name',
            'value' => 'value',
            'note' => 'note'
        ];
    }
    /**
     * Get google access token from database
     * @return string google access token
     */

    public static function getAccessToken()
    {
        $accessToken = Settings::findFirstByName("googleAnalyticAccessToken");
        if ($accessToken && $accessToken->value) {
            return $accessToken->value;
        }
        return null;
    }

    /**
     * Get google refresh code from database
     * @return string google access token
     */

    public static function getRefreshToken()
    {
        $refreshToken = Settings::findFirstByName("googleAnalyticRefreshToken");
        if ($refreshToken && $refreshToken->value) {
            return $refreshToken->value;
        }
        return null;
    }

    /**
     * Set google access code to database
     * @param string $code google analytic access code
     * @return boolean true if all ok. other wise, false
     */


    public static function setAccessToken($code)
    {
        $accessToken = Settings::findFirstByName("googleAnalyticAccessToken");
        if ($accessToken) {
            $accessToken->value = $code;
            if ($accessToken->save()) {
                return true;
            }
        }
        return false;
    }

    /**
     * Set google refresh code to database
     * @param string $code google analytic access code
     * @return boolean true if all ok. other wise, false
     */


    public static function setRefreshToken($code)
    {
        $refreshToken = Settings::findFirstByName("googleAnalyticRefreshToken");
        if ($refreshToken) {
            $refreshToken->value = $code;
            if ($refreshToken->save()) {
                return true;
            }
        }
        return false;
    }

    public static function clearAuth()
    {
        Settings::setAccessToken("");
        Settings::setRefreshToken("");
        Settings::setAnalyticAccountID("");
        Settings::setAnalyticProfileID("");
        Settings::setAnalyticTrackingID("");
    }

    public static function setAnalyticProfileID($profileID)
    {
        $profileObj = Settings::findFirstByName("googleAnalyticProfileId");
        if ($profileObj) {
            $profileObj->value = $profileID;
            if ($profileObj->save()) {
                return true;
            }
        }
        return false;
    }

    public static function setAnalyticTrackingID($trackingID)
    {
        $trackingObj = Settings::findFirstByName("googleAnalyticTrackingId");
        if ($trackingObj) {
            $trackingObj->value = $trackingID;
            if ($trackingObj->save()) {
                return true;
            }
        }
        return false;
    }

    public static function getAnalyticTrackingID()
    {
        $trackingObj = Settings::findFirstByName("googleAnalyticTrackingId");
        if ($trackingObj && $trackingObj->value) {
            return $trackingObj->value;
        }
        return null;
    }

    public static function getAnalyticProfileID()
    {
        $profileObj = Settings::findFirstByName("googleAnalyticProfileId");
        if ($profileObj && $profileObj->value) {
            return $profileObj->value;
        }
        return null;
    }

    public static function setAnalyticAccountID($accountID)
    {
        $accountObj = Settings::findFirstByName("googleAnalyticAccountId");
        if ($accountObj) {
            $accountObj->value = $accountID;
            if ($accountObj->save()) {
                return true;
            }
        }
        return false;
    }

    public static function getAnalyticAccountID()
    {
        $accountObj = Settings::findFirstByName("googleAnalyticAccountId");
        if ($accountObj && $accountObj->value) {
            return $accountObj->value;
        }
        return null;
    }

    public static function getListTopActivity()
    {
        $activitiesObj = Settings::findFirstByName("googleAnalyticTopActivities");
        if ($activitiesObj && $activitiesObj->value) {
            return json_decode($activitiesObj->value);
        }
    }

    public static function setItem($name, $value)
    {
        $obj = Settings::findFirstByName($name);
        if ($obj) {
            $obj->value = $value;
            if ($obj->save()) {
                return true;
            }
        }
        return false;
    }

    public static function setListTopActivity($arrayTop)
    {
        $listTopActivity = Settings::getListTopActivity();
        for ($i = 0; $i < count($listTopActivity); $i++) {
            $listTopActivity[$i]->default = 0;
            foreach ($arrayTop as $key => $element) {
                if ($listTopActivity[$i]->code == $element) {
                    $listTopActivity[$i]->default = 1;
                }
            }
        }
        $listTopActivity = json_encode($listTopActivity);
        return Settings::setItem("googleAnalyticTopActivities", $listTopActivity);
    }
}
