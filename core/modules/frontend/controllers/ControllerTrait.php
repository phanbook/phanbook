<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The GNU License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
 */
namespace Phanbook\Frontend\Controllers;
use Phanbook\Models\Posts;
use Phanbook\Models\Tags;
/**
 * Class TestsController
 *
 * @package Phanbook\Frontend\Controllers
 */
trait ControllerTrait 
{
    public $itemBuilder;

    public $totalPages = 1;

    public $page = 1;

    public $slugName = '';


    public function abc()
    {
        $this->view->setVars(
            [
                'tab'         => 'tags',
                'type'        => Posts::POST_ALL,
                'totalPages'  => $totalPages,
                'currentPage' => $page,
                'slugName'    => $slugName,
                'tags'        => Tags::find()
            ]
        );
        if (is_object($itemBuilder)) {
            d('abc');
            $this->view->posts =  $this->itemBuilder->getQuery()->execute();
        }
    }
  
}
