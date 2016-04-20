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
use Phalcon\Logger\Adapter\File as Logger;

use Phanbook\Models\Audit;
use Phanbook\Models\ModelBase;
use Phanbook\Models\AuditDetail;

/**
 * Phanbook\Model\Behavior\Blameable
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
        //Skip if it is cli
        if ($model->getDI()->has('isCli')) {
            return;
        }
        //Get the session service
        $auth    = $model->getDI()->getAuth();
        if (!empty($auth->getUserId())) {
            //Get the request service
            $request = $model->getDI()->getRequest();
            $random  = new Random();
            $audit   = new Audit();

            $audit->setId($random->uuid());
            $audit->setUserId($auth->getUserId());
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
        $audit = $this->createAudit('C', $model);
        if (is_object($audit)) {
            $metaData = $model->getModelsMetaData();
            $fields   = $metaData->getAttributes($model);
            $details  = [];
            $random = new Random();
            //Ignore audit log posts when it create
            if ($model->getSource() != 'posts') {
                foreach ($fields as $field) {
                    $auditDetail = new AuditDetail();
                    $auditDetail->setId($random->uuid());
                    $auditDetail->setFieldName($field);
                    $auditDetail->setOldValue(null);
                    $newValue = $model->readAttribute($field) ? : 'empty';
                    $auditDetail->setNewValue($newValue);

                    $details[] = $auditDetail;
                }
                $audit->details = $details;
                if (!$audit->save()) {
                    ModelBase::saveLoger($audit->getMessages());
                }
            }
        }
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
        if (is_object($audit)) {
            //Date the model had before modifications
            $originalData = $model->getSnapshotData();
            $details = [];
            $random = new Random();
            foreach ($changedFields as $field) {
                $auditDetail = new AuditDetail();
                $auditDetail->setId($random->uuid());
                $auditDetail->setFieldName($field);
                $auditDetail->setOldValue($originalData[$field]);
                $newValue = $model->readAttribute($field) ? : 'empty';
                $auditDetail->setNewValue($newValue);

                $details[] = $auditDetail;
            }
            $audit->details = $details;
            if (!$audit->save()) {
                ModelBase::saveLoger($audit->getMessages());
            }
        }
    }
}
