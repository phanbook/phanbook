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
namespace Phanbook\Models\Behavior;

use Phalcon\Mvc\Model\Behavior;
use Phalcon\Mvc\Model\BehaviorInterface;
use Phalcon\Mvc\ModelInterface;
use Phalcon\Security\Random;

use Phanbook\Models\Audit;
use Phanbook\Models\AuditDetail;

/**
 * Phanbook\Model\Behavior\Blameable
 *
 */
class Blameable extends Behavior implements BehaviorInterface
{
    /**
     * {@inheritdoc}
     *
     * @param string                      $eventType
     * @param \Phalcon\Mvc\ModelInterface $model
     */
    public function notify($eventType, ModelInterface $model)
    {
        //Fires 'logAfterUpdate' if the event is 'afterCreate'
        if ($eventType == 'afterCreate') {
            return $this->auditAfterCreate($model);
        }

        //Fires 'logAfterUpdate' if the event is 'afterUpdate'
        if ($eventType == 'afterUpdate') {
            return $this->auditAfterUpdate($model);
        }
    }

    /**
     * Creates an Audit isntance based on the current enviroment
     *
     * @param  string                      $type
     * @param  \Phalcon\Mvc\ModelInterface $model
     * @return Audit
     */
    public function createAudit($type, ModelInterface $model)
    {
        //Get the session service
        $auth    = $model->getDI()->getAuth();

        //Get the request service
        $request = $model->getDI()->getRequest();
        $random  = new Random();
        $audit   = new Audit();

        $audit->setId($random->uuid());
        $audit->setUserId($auth->getId());
        //The model who performed the action
        $audit->setModelname(get_class($model));

        //The client IP address
        $audit->setIpaddress(ip2long($request->getClientAddress()));

        //Action is an update
        $audit->setType($type);

        //Current time
        $audit->setCreatedAt(date('Y-m-d H:i:s'));

        return $audit;
    }

    /**
     * Audits an DELETE operation
     *
     * @param  \Phalcon\Mvc\ModelInterface $model
     * @return boolean
     */
    public function auditAfterCreate(ModelInterface $model)
    {
        //Create a new audit
        $audit    = $this->createAudit('C', $model);
        $metaData = $model->getModelsMetaData();
        $fields   = $metaData->getAttributes($model);
        $details  = array();

        foreach ($fields as $field) {
            $auditDetail = new AuditDetail();
            $auditDetail->setFieldName($field);
            $auditDetail->setOldValue(null);
            $auditDetail->setNewValue($model->readAttribute($field));

            $details[] = $auditDetail;
        }

        $audit->details = $details;

        return $audit->save();
    }

    /**
     * Audits an UPDATE operation
     *
     * @param  \Phalcon\Mvc\ModelInterface $model
     * @return boolean
     */
    public function auditAfterUpdate(ModelInterface $model)
    {
        $changedFields = $model->getChangedFields();

        if (count($changedFields) == 0) {
            return null;
        }

        //Create a new audit
        $audit = $this->createAudit('U', $model);

        //Date the model had before modifications
        $originalData = $model->getSnapshotData();

        $details = array();
        $random = new Random();
        foreach ($changedFields as $field) {
            $auditDetail = new AuditDetail();
            $auditDetail->setId($random->uuid());
            $auditDetail->setFieldName($field);
            $auditDetail->setOldValue($originalData[$field]);
            $auditDetail->setNewValue($model->readAttribute($field));

            $details[] = $auditDetail;
        }
        $audit->details = $details;
        if (!$audit->save()) {
            $this->saveLoger($audit->getMessages());
        }
        return true;
    }
    /**
     *
     * @return mixed
     */
    public function saveLoger($e)
    {
        $logger = new Logger(ROOT_DIR . 'content/logs/error.log');
        if (is_object($e)) {
            $logger->error($e[0]->getMessages());
            $logger->error($e[0]->getTraceAsString());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                $logger->error($message->getMessage());
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }
        return false;
    }
}
