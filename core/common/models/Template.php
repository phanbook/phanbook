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

use Phalcon\Mvc\Model\Validator\Uniqueness;
use Phalcon\Mvc\Model\Message;

class Template extends ModelBase
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
    protected $key;

    /**
     *
     * @var string
     */
    protected $subject;

    /**
     *
     * @var string
     */
    protected $content;

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
     * Method to set the value of field name
     *
     * @param string $name
     *
     * @return $this
     */
    public function setName($name)
    {
        $this->name = $name;

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
     * Method to set the value of field subject
     *
     * @param string $subject
     *
     * @return $this
     */
    public function setSubject($subject)
    {
        $this->subject = $subject;

        return $this;
    }

    /**
     * Method to set the value of field content
     *
     * @param string $content
     *
     * @return $this
     */
    public function setContent($content)
    {
        $this->content = $content;

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
     * Returns the value of field key
     *
     * @return string
     */
    public function getKey()
    {
        return $this->key;
    }

    /**
     * Returns the value of field subject
     *
     * @return string
     */
    public function getSubject()
    {
        return $this->subject;
    }

    /**
     * Returns the value of field content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    public function getSource()
    {
        return 'template';
    }

    /**
     * Independent Column Mapping.
     */
    public function columnMap()
    {
        return array(
            'id'      => 'id',
            'name'    => 'name',
            'key'     => 'key',
            'subject' => 'subject',
            'content' => 'content'
        );
    }

    public function initialize()
    {
        $this->useDynamicUpdate(true);
    }

    public function validation()
    {
        $this->validate(
            new Uniqueness(
                array(
                    "field"   => array('key'),
                    "message" => t("Another template with the key you submitted already exists.")
                )
            )
        );
        if ($this->validationHasFailed() == true) {
            return false;
        }

        return true;
    }

    public function save($data = null, $whiteList = null)
    {
        if (!$this->manageFile()) {
            return false;
        }

        return parent::save($data, $whiteList);
    }

    private function getFirstTemplateEngine()
    {
        foreach ($this->getDi()->getView()->getRegisteredEngines() as $engine => $closure) {
            return $engine;
        }
    }

    /**
     * Save or delete an email template file.
     *
     * @param bool $delete
     *
     * @return bool|string
     */
    public function manageFile($delete = false)
    {
        $templateFile = $this->getKey() . $this->getFirstTemplateEngine();
        $dir          = $this->getDi()->get('config')->application->templatesDir;
        //d($dir);
        if (!is_writeable($dir)) {
            $message = new Message(t('Directory for saving template is not writable.'));
            $this->appendMessage($message);

            return false;
        }

        if ($delete && unlink($dir . $templateFile)) {
            return true;
        }

        if (file_put_contents($dir . $templateFile, $this->getContent())) {
            return true;
        }

        $message = new Message(t('File template could not be changed.'));
        $this->appendMessage($message);

        return false;
    }

    public function delete($data = null, $whiteList = null)
    {
        if (!$this->manageFile(true)) {
            return false;
        }

        return parent::delete($data, $whiteList);
    }
}
