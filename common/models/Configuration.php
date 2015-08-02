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

use Phalcon\Mvc\Model\Validator\InclusionIn;
use Phalcon\Mvc\Model\Validator\Uniqueness;

class Configuration extends ModelBase
{

    /**
     *
     * @var integer
     */
    protected $id;

    /**
     *
     * @var integer
     */
    protected $idOrganization;

    /**
     *
     * @var string
     */
    protected $key;

    /**
     *
     * @var string
     */
    protected $type;

    /**
     *
     * @var string
     */
    protected $value;

    /**
     *
     * @var string
     */
    protected $caption;

    /**
 * @var array Configuration cache
*/
    protected static $conf;


    const TYPE_BOOL   = 'bool';
    const TYPE_STRING = 'string';
    const TYPE_INT    = 'int';
    const TYPE_ARRAY  = 'array';

    const ARRAY_TYPE_SEPARATOR = ';';

    /**
     * Method to set the value of field id
     *
     * @param integer $id
     *
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field idOrganization
     *
     * @param integer $idOrganization
     *
     * @return $this
     */
    public function setIdOrganization($idOrganization)
    {
        $this->idOrganization = $idOrganization;

        return $this;
    }

    /**
     * Method to set the value of field key
     *
     * @param string $key
     *
     * @return $this
     */
    public function setKey($key)
    {
        $this->key = $key;

        return $this;
    }

    /**
     * Method to set the value of field type
     *
     * @param string $type
     *
     * @return $this
     */
    public function setType($type)
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Method to set the value of field value
     *
     * @param string $value
     *
     * @return $this
     */
    public function setValue($value)
    {
        $this->value = $value;

        return $this;
    }

    /**
     * Method to set the value of field caption
     *
     * @param string $caption
     *
     * @return $this
     */
    public function setCaption($caption)
    {
        $this->caption = $caption;

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
     * Returns the value of field id
     *
     * @return integer
     */
    public function getIdOrganization()
    {
        return $this->idOrganization;
    }

    /**
     * Returns the value of field key
     *
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }

    /**
     * Returns the value of field type
     *
     * @return string
     */
    public function getType()
    {
        return $this->type;
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
     * Returns the value of field caption
     *
     * @return string
     */
    public function getCaption()
    {
        return $this->caption;
    }

    public function getSource()
    {
        return 'configuration';
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'             => 'id',
            'idOrganization' => 'idOrganization',
            'key'            => 'key',
            'type'           => 'type',
            'value'          => 'value',
            'caption'        => 'caption'
        );
    }

    public function validation()
    {
        $this->validate(
            new InclusionIn(
                [
                    'field'   => 'type',
                    'message' => t('The type must be bool, string, int, or array'),
                    'domain'  => array_flip($this->getTypesWithLabels())
                ]
            )
        );
        $this->validate(
            new Uniqueness(
                array(
                    "field"   => array('key', 'idOrganization'),
                    "message" => t("Another configuration with the key for that organization already exists.")
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    public static function getTypesWithLabels()
    {
        return [
            self::TYPE_BOOL   => 'Boolean',
            self::TYPE_STRING => 'String',
            self::TYPE_INT    => 'Integer',
            self::TYPE_ARRAY  => 'Array'
        ];
    }

    public static function get($key)
    {
        $cacheKey     = 'configuration';
        $di           = \Phalcon\DI::getDefault();
        $cacheService = $di->get('modelsCache');

        if ($cacheService->exists($cacheKey)) {
            self::$conf = $cacheService->get($cacheKey);
        }

        // If conf is not initialized, try manual query
        if (empty(self::$conf)) {
            if (!Configuration::loadConfiguration()) {
                return false;
            }

            if (!isset(self::$conf[$key])) {
                $configuration = Configuration::findFirst('key = \'' . $key . '\'');
                if (!$configuration) {
                    return false;
                }
                $value = $configuration->getValue();
                if ($configuration->getType() == self::TYPE_ARRAY) {
                    $value = explode(self::ARRAY_TYPE_SEPARATOR, $configuration->getValue());
                    $value = array_combine($value, $value);
                }

                return $value;
            }
        }

        return self::$conf[$key];
    }

    /**
     * Load all configuration data
     */
    private static function loadConfiguration()
    {
        $configurations = Configuration::find();
        if (!count($configurations)) {
            return false;
        }

        foreach ($configurations as $configuration) {
            $value = $configuration->getValue();
            if ($configuration->getType() == self::TYPE_ARRAY) {
                $value = explode(self::ARRAY_TYPE_SEPARATOR, $configuration->getValue());
                $value = array_combine($value, $value);
            }
            self::$conf[$configuration->getKey()] = $value;
        }

        $cacheKey     = 'configuration';
        $di           = \Phalcon\DI::getDefault();
        $cacheService = $di->get('modelsCache');
        $cacheService->save($cacheKey, self::$conf);

        return true;
    }
}
