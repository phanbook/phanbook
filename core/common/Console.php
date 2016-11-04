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
namespace Phanbook\Common;

use Phalcon\DiInterface;
use Phalcon\Events\Manager;
use Phanbook\Tools\Cli\Output;
use Phalcon\Cli\Console as CLIConsole;
use Phalcon\Di\FactoryDefault\Cli as CliDi;
use Phanbook\Common\Exceptions\Cli\BadCliCallException;

/**
 *\Phanbook\Console
 *
 * @package Phanbook
 */
class Console extends CLIConsole
{
    const ERROR_SINGLE = 999;

    /**
     * @var DiInterface
     */
    private $di;

    /**
     * @var string filename that will store the pid
     */
    protected $pidFile;

    /**
     * @var string directory path that will contain the pid file
     */
    protected $pidDir = '/tmp';

    /**
     * @var bool if debug mode is on or off
     */
    protected $isDebug;

    /**
     * whether to record tasks by inserting into the database or not
     * @var bool
     */
    protected $isRecording = false;

    /**
     * @var
     */
    protected $argc;

    /**
     * @var
     */
    protected $argv;

    /**
     * @var bool
     */
    protected $isSingleInstance = false;

    /**
     * Task for cli handler to run.
     */
    protected $task = null;

    /**
     * Action for cli handler to run.
     */
    protected $action = null;

    /**
     * Parameters to be passed to Task.
     *
     * @var array
     */
    protected $params = [];

    /**
     * Task Id from the database.
     *
     * @var int
     */
    protected $taskId = null;

    protected $stderr = '';
    protected $stdout = '';
    protected $mode;

    /**
     * Console constructor - set the dependency Injector.
     *
     * @param DiInterface $di
     */
    public function __construct(DiInterface $di = null)
    {
        $this->di = $di ?: new CliDi();

        // Set the dependency Injector
        parent::__construct($this->di);
    }

    /**
     * Set Application arguments.
     *
     * @param array $argv array of arguments
     * @param int $argc count of arguments
     *
     * @return $this
     */
    public function setArgs($argv, $argc)
    {
        $this->argv = $argv;
        $this->argc = $argc;

        return $this;
    }

    /**
     * Set events to be triggered before/after certain stages in Micro App.
     *
     * @param Manager $events events to add
     */
    public function setEvents(Manager $events)
    {
        $this->setEventsManager($events);
    }

    /**
     * kick off the task.
     */
    public function run()
    {
        try {
            $exit = 0;
            $taskId = null;

            // Check on stupid mistakes
            $this->preTaskCheck($this->argc);

            $this->determineTask($this->argv);
            // Check Instance Mode (can only one run at a time)
            $this->checkProcessInstance($this->argv);

            // Add Record to DB that task started
            if ($this->isRecording) {
            }

            // Setup args (task, action, params) for console
            $args['task'] = 'Phanbook\Cli\Tasks' . "\\" . $this->task;
            $args['action'] = !empty($this->action) ? $this->action : 'main';
            if (!empty($this->params)) {
                $args['params'] = $this->params;
            }
            // Kick off Task
            $this->handle($args);

            $this->removeProcessInstance();

            // Update status
            if ($this->isRecording) {
                $task->updateSuccessful($this->taskId, Output::getStdout(), Output::getStderr(), $exit);
            }
        } catch (\Phanbook\Tools\Cli\Exception $e) {
            $exit = 3;
            $this->handleException($e, $this->taskId, $exit);
        } catch (\Phalcon\Exception $e) {
            $exit = 2;
            $this->handleException($e, $this->taskId, $exit);
        } catch (\Exception $e) {
            $exit = 1;
            $this->handleException($e, $this->taskId, $exit);
        }

        return $exit;
    }

    /**
     * Check if pid file needs to be created.
     *
     * @param array $argv cli arguments
     */
    public function checkProcessInstance($argv)
    {
        // Single Instance
        if ($this->isSingleInstance()) {
            $file = sprintf('%s-%s.pid', $this->task, $this->action);
            $pid = \Cli\Pid::singleton($file);

            // Default
            $this->pidFile = $file;

            // Make sure only 1 app at a time is running
            if ($pid->exists()) {
                throw new \Exception('Instance of task is already running', self::ERROR_SINGLE);
            } else {
                // Create PID File
                /*
                $fp = fopen($this->_pidFile, 'r+');
                if (!flock($fp, LOCK_EX | LOCK_NB)) {
                    fclose($fp);
                    throw new \exceptions\System('unable to create pid file', $desc);
                }*/

                if ($pid->create()) {
                    if ($this->isDebug()) {
                        Output::stdout("[DEBUG] Created Pid File: " . $pid->getFileName());
                    }
                } else {
                    $desc = '';
                    throw new \exceptions\System('unable to create pid file', $desc);
                }

                if (!file_put_contents($this->pidFile, getmypid())) {
                    $desc = '';
                    throw new \exceptions\System('unable to create pid file', $desc);
                }
            }
        }
    }

    /**
     * Remove Pid File.
     *
     * @return bool
     */
    public function removeProcessInstance()
    {
        if ($this->isSingleInstance()) {
            $pid = \Cli\Pid::singleton('');
            if ($pid->created() && !$pid->removed()) {
                if ($result = $pid->remove()) {
                    if ($this->isDebug()) {
                        Output::stdout("[DEBUG] Removed Pid File: " . $pid->getFileName());
                    }
                } else {
                    $msg = " Failed to remove Pid File: $this->pidFile";
                    Output::stderr(Output::COLOR_RED . "[ERROR]" . Output::COLOR_NONE . $msg);
                }

                return $result;
            }
        }

        return true;
    }

    /**
     * Get the task/action to direct to.
     *
     * @param array $flags cli arguments to determine tasks/action/param
     *
     * @throws \Exception
     */
    protected function determineTask($flags)
    {
        // Since first argument is the name so script executing (pop it off the list)
        array_shift($flags);

        if (is_array($flags) && !empty($flags)) {
            foreach ($flags as $flag) {
                if (empty($this->task) && !$this->isFlag($flag)) {
                    $this->task = $flag;
                } elseif (empty($this->action) && !$this->isFlag($flag)) {
                    $this->action = $flag;
                } elseif (!$this->isFlag($flag)) {
                    $this->params[] = $flag;
                }
            }
            return;
        }

        throw new \Exception('Unable to determine task/action/params');
    }

    /**
     * Set mode of multiple or single instance at a time.
     *
     * @param int $mode
     */
    public function setMode($mode)
    {
        $this->mode = $mode;
    }

    /**
     * set the directory location of the pid file.
     *
     * @param $dir string
     */
    public function setPidDir($dir)
    {
        $this->pidDir = $dir;
    }

    /**
     * make sure everything required is setup before starting the task.
     *
     * @param int $argc count of arguments
     * @throws BadCliCallException
     */
    protected function preTaskCheck($argc)
    {
        // Make sure task is added
        if ($argc < 2) {
            throw new BadCliCallException(
                'Invalid number of parameters required for for script.' . PHP_EOL . PHP_EOL .
                'Examples:' . PHP_EOL .
                '  cli [task] [action] [param1 [param2 ...]]' . PHP_EOL .
                '  cli Example index' . PHP_EOL .
                '  cli Example index --debug --single --no-record'. PHP_EOL . PHP_EOL
            );
        }
    }

    /**
     * sets debug mode.
     *
     * @param bool $debug
     */
    public function setDebug($debug)
    {
        $this->isDebug = $debug;
        if ($debug) {
            error_reporting(E_ALL);
            ini_set('display_errors', 1);
        }
    }

    public function isDebug()
    {
        return $this->isDebug;
    }

    /**
     * Set Application to record results to database.
     *
     * @param bool
     */
    public function setRecording($record)
    {
        $this->isRecording = $record;
    }

    /**
     * Determine if application is recording output (stdout and stderr) to database.
     *
     * @return bool
     */
    public function isRecording()
    {
        return $this->isRecording;
    }

    /**
     * Set Single Instance Flag.
     *
     * @param bool
     */
    public function setSingleInstance($single)
    {
        $this->isSingleInstance = $single;
    }

    /**
     * determine if only a single instance is allowed to run.
     *
     * @return bool
     */
    public function isSingleInstance()
    {
        return $this->isSingleInstance;
    }

    /**
     * handle script ending exception.
     *
     * @param \Exception $e Exception that caused the failure
     * @param int $taskId id of the task you started
     * @param int $exit exit code status of the process
     */
    protected function handleException(\Exception $e, $taskId, $exit)
    {
        $sub = '%s[ERROR]%s %s file: %s line: %d';

        // Remove Process Instance
        if ($e->getCode() != self::ERROR_SINGLE) {
            $this->removeProcessInstance();
        }

        // Update Failure
        if ($this->isRecording && $taskId > 0) {
            $stdout = Output::getStdout();
            $stderr = Output::getStderr();
            //  Update Task w/ error messages
            $task = new \Models\Task();
            $task->updateFailed($taskId, $stdout, $stderr, $exit);
        }

        $msg = sprintf($sub, Output::COLOR_RED, Output::COLOR_NONE, $e->getMessage(), $e->getFile(), $e->getLine());

        // Let user that ran this know it failed
        Output::stderr($msg);
    }

    /**
     * Determine if argument is a special flag.
     *
     * @param string
     *
     * @return bool
     */
    protected function isFlag($flag)
    {
        return substr(trim($flag), 2) == '--';
    }

    /**
     * Get the PID File location.
     *
     * @return string
     */
    public function getPidFile()
    {
        return $this->pidFile;
    }

    /**
     * Get the auto incremented value for current task.
     *
     * @return int|NULL
     */
    public function getTaskId()
    {
        return $this->taskId;
    }
}
