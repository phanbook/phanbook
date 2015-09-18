<?php
namespace Phanbook\Tools\Cli;

class Command
{
    /**
     * @var string command executed
     */
    public $command;

    /**
     * @var string file that executed command
     */
    public $file;

    /**
     * @var int on which line was command executed
     */
    public $line;

    /**
     * @var bool was command successful
     */
    public $success;

    /**
     * @var string  standard output from command
     */
    public $stdout;

    /**
     * @var string  error output from command
     */
    public $stderr;

    /**
     * @var string time taken for command to execute
     */
    public $time;

    /**
     * @var int command status/return result
     */
    public $result_code;


    /**
     * echo out command to table row display
     */
    public function toRow()
    {
        echo "<tr><td>{$this->command}</td><td>{$this->file}</td><td>{$this->line}</td></tr>";
    }
}
