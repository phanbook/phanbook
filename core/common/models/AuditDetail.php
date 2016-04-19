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

class Auditdetail extends ModelBase
{

    /**
     *
     * @var string
     */
    protected $id;

    /**
     *
     * @var string
     */
    protected $auditId;

    /**
     *
     * @var string
     */
    protected $fieldName;

    /**
     *
     * @var string
     */
    protected $oldValue;

    /**
     *
     * @var string
     */
    protected $newValue;

    /**
     * Method to set the value of field id
     *
     * @param  string $id
     * @return $this
     */
    public function setId($id)
    {
        $this->id = $id;

        return $this;
    }

    /**
     * Method to set the value of field auditId
     *
     * @param  string $auditId
     * @return $this
     */
    public function setAuditId($auditId)
    {
        $this->auditId = $auditId;

        return $this;
    }

    /**
     * Method to set the value of field fieldName
     *
     * @param  string $fieldName
     * @return $this
     */
    public function setFieldName($fieldName)
    {
        $this->fieldName = $fieldName;

        return $this;
    }

    /**
     * Method to set the value of field oldValue
     *
     * @param  string $oldValue
     * @return $this
     */
    public function setOldValue($oldValue)
    {
        $this->oldValue = $oldValue;

        return $this;
    }

    /**
     * Method to set the value of field newValue
     *
     * @param  string $newValue
     * @return $this
     */
    public function setNewValue($newValue)
    {
        $this->newValue = $newValue;

        return $this;
    }

    /**
     * Returns the value of field id
     *
     * @return string
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Returns the value of field auditId
     *
     * @return string
     */
    public function getAuditId()
    {
        return $this->auditId;
    }

    /**
     * Returns the value of field fieldName
     *
     * @return string
     */
    public function getFieldName()
    {
        return $this->fieldName;
    }

    /**
     * Returns the value of field oldValue
     *
     * @return string
     */
    public function getOldValue()
    {
        return $this->oldValue;
    }

    /**
     * Returns the value of field newValue
     *
     * @return string
     */
    public function getNewValue()
    {
        return $this->newValue;
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'auditDetail';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Auditdetail[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param  mixed $parameters
     * @return Auditdetail
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }
    /**
     * Hook Phalcon
     */
    public function initialize()
    {
        $this->belongsTo('auditId', __NAMESPACE__ .'\Audit', 'id');
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
            'auditId' => 'auditId',
            'fieldName' => 'fieldName',
            'oldValue' => 'oldValue',
            'newValue' => 'newValue'
        ];
    }
}
