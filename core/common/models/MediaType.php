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

use Phalcon\Config\Adapter\Php         as AdapterPhp;

class MediaType extends ModelBase
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
     * @var mixed
     */
    protected $code;

    /**
     *
     * @var string
     */
    protected $note;

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
     * Method to set the value of field code
     *
     * @param string $code
     */
    public function setCode($code)
    {
        $this->code = $code;

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
     * Return the value of field code
     *
     * @return string
     */
    public function getCode()
    {
        return $this->code;
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
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'mediaType'");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mediaType';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Mediatype[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Mediatype
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
        return array(
            'id' => 'id',
            'name' => 'name',
            'code'  =>  'code',
            'note' => 'note'
        );
    }
    /**
     * get file extension allowed for upload from db
     * @return list extension allowed
     */
    public static function getExtensionAllowed()
    {
        $exts = MediaType::find();
        $extsAllowed = [];
        foreach ($exts as $mediaObj) {
            $tmp = explode(",", $mediaObj->getCode());
            $extsAllowed = array_merge($extsAllowed, $tmp);
        }
        return $extsAllowed;
    }
    /**
     * get Type from extension
     * @param  string $ext
     * @return mixed  type
     */
    public static function getTypeFromExt($ext)
    {
        $type = MediaType::findFirst(
            [
                "conditions" => "code LIKE ?1",
                "bind"       => array(1 => "%". $ext. "%")
            ]
        );
        return $type;
    }

    public static function getTypeFromName($name)
    {
        $type = MediaType::findFirst(
            [
                "conditions" => "name = ?1",
                "bind"       => array(1 => $name)
            ]
        );
        return $type;
    }
    /**
     * Get default media type
     * @return mixed
     */
    public static function getConfig()
    {
        $names = MediaType::find();
        $config = [];
        foreach ($names as $key) {
            $config[$key->getName()] = 0;
        }
        return $config;
    }

    // public static function getConfigFile($userName)
    // {
    //     $filename = ROOT_DIR. 'content/uploads/'. $userName. "/userConfig.php";
    //     if (file_exists($filename))
    //         return (new AdapterPhp($filename))->toArray();
    //     return [];
    // }
    // public static function saveConfigFile($userName,$arrayConfig)
    // {
    //     $filename = ROOT_DIR. 'content/uploads/'. $userName. "/userConfig.php";
    //     if (!file_exists($filename)) {
    //         $makeFile = ZFunction::makeFile($filename);
    //         file_put_contents($filename, "<?php return [];");
    //     }
    //     if (file_exists($filename)) {
    //         $data   = new AdapterPhp($filename);
    //         $result = array_merge($data->toArray(), $arrayConfig);
    //         $result ='<?php return ' . var_export($result, true) . ';';

    //         if (!file_put_contents($filename, $result)) {
    //             return false;
    //         }
    //         return true;
    //     }
    // }
}
