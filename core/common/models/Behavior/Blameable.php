<?php
/**
 * Phanbook : Delightfully simple forum software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Models\Behavior;

use Phanbook\Models\Audit;
use Phalcon\Security\Random;
use Phalcon\Mvc\ModelInterface;
use Phalcon\Mvc\Model\Behavior;
use Phanbook\Models\AuditDetail;
use Phalcon\Mvc\Model\BehaviorInterface;
use Phanbook\Common\Library\Behavior\Di as DiBehavior;

/**
 * \Phanbook\Models\Behavior\Blameable
 *
 * @package Phanbook\Models\Behavior
 */
class Blameable extends Behavior implements BehaviorInterface
{
    use DiBehavior {
        DiBehavior::__construct as protected injectDi;
    }

    /**
     * Blameable constructor.
     *
     * @param array $options
     */
    public function __construct(array $options = null)
    {
        parent::__construct($options);

        $this->injectDi();
    }

    /**
     * {@inheritdoc}
     *
     * @param string         $eventType
     * @param ModelInterface $model
     * @return bool
     */
    public function notify($eventType, ModelInterface $model)
    {
        // Fires 'logAfterUpdate' if the event is 'afterCreate'
        if ($eventType == 'afterCreate') {
            return $this->auditAfterCreate($model);
        }

        // Fires 'logAfterUpdate' if the event is 'afterUpdate'
        if ($eventType == 'afterUpdate') {
            return $this->auditAfterUpdate($model);
        }

        return true;
    }

    /**
     * Creates an Audit instance based on the current environment
     *
     * @param  string         $type Creating 'C' or updating 'U'
     * @param  ModelInterface $model
     * @return Audit|null
     */
    public function createAudit($type, ModelInterface $model)
    {
        // Skip on console mode
        if (PHP_SAPI == 'cli') {
            return null;
        }

        // Get the session service
        if ($this->getDI()->has('auth')) {
            return null;
        }

        /** @var \Phanbook\Auth\Auth $auth */
        $auth = $this->getDI()->getShared('auth');

        if ($auth->isAuthorizedVisitor()) {
            return null;
        }

        /** @var \Phalcon\Http\Request $request */
        $request = $this->getDI()->getShared('request');

        $random = new Random();
        $audit  = new Audit();

        $audit->setId($random->uuid());
        $audit->setUserId($auth->getUserId());
        $audit->setModelName(get_class($model));
        $audit->setIpaddress(ip2long($request->getClientAddress()));
        $audit->setType($type);
        $audit->setCreatedAt(date('Y-m-d H:i:s'));

        return $audit;
    }

    /**
     * Audits an CREATE operation
     *
     * @param  \Phalcon\Mvc\ModelInterface $model
     * @return boolean
     */
    public function auditAfterCreate(ModelInterface $model)
    {
        // Create a new audit
        if (!$audit = $this->createAudit('C', $model)) {
            return false;
        }

        $metaData = $model->getModelsMetaData();
        $fields   = $metaData->getAttributes($model);
        $details  = [];
        $random = new Random();
        // Ignore audit log posts when it create
        if ($model->getSource() != 'posts') {
            foreach ($fields as $field) {
                $auditDetail = new AuditDetail();
                $auditDetail->setId($random->uuid());
                $auditDetail->setFieldName($field);
                $auditDetail->setOldValue(null);
                $newValue = $model->readAttribute($field) ?: 'empty';
                $auditDetail->setNewValue($newValue);

                $details[] = $auditDetail;
            }
            $audit->details = $details;
            // @todo: Move this to a common place
            if (!$audit->save()) {
                if ($this->getDI()->has('logger')) {
                    $messages = [];
                    foreach ($audit->getMessages() as $message) {
                        $messages[] = (string) $message;
                    }
                    $this->getDI()->getShared('logger')->error(implode('; ', $messages));
                    return false;
                }
            }
        }

        return true;
    }

    /**
     * Audits an UPDATE operation
     *
     * @param  ModelInterface $model
     * @return bool
     */
    public function auditAfterUpdate(ModelInterface $model)
    {
        $changedFields = $model->getChangedFields();

        if (!count($changedFields)) {
            return false;
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
            // @todo: Move this to a common place
            if (!$audit->save()) {
                if ($this->getDI()->has('logger')) {
                    $messages = [];
                    foreach ($audit->getMessages() as $message) {
                        $messages[] = (string) $message;
                    }
                    $this->getDI()->getShared('logger')->error(implode('; ', $messages));
                    return false;
                }
            }
        }

        return true;
    }
}
