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
namespace Phanbook\Frontend\Controllers;

use Phalcon\Mvc\View;
use Phanbook\Models\Tags;
use Phanbook\Models\Posts;

/**
 * Class HelpController
 *
 * @package Phosphorum\Controllers
 */
class TagsController extends ControllerBase
{
    public function indexAction()
    {
        $page  = isset($_GET['page'])?(int)$_GET['page']:1;
        $model = [
            'name'      => 'Phanbook\Models\Tags',
            'orderBy'   => 'id',
            'currentOrder' => 'tags'
        ];
        //Create a Model paginator
        $this->paginatorQueryBuilder($model, $page);
        $this->assets->addCss('core/assets/css/help.css');
        $this->tag->setTitle(t('All tags'));
    }

    public function tagSuggestAction()
    {
        $this->view->disable();
        $this->setJsonResponse();
        $q = $this->request->getQuery('q', 'string');

        if ($q) {
            $tags = Tags::query()
                //->columns('Phanbook\Models\Tags.slug')
                ->Where('name LIKE "%' . $q . '%"')
                ->execute();
            $params = ['tags' => $tags->toArray()];
            if ($this->request->isAjax()) {
                /**
                 * Hierarchical Rendering
                 * @link https://docs.phalconphp.com/en/latest/reference/views.html#stand-alone-component
                 */
                echo $this->view->getRender(
                    'partials',
                    'tags-suggestions',
                    $params,
                    function ($view) {
                        $view->setRenderLevel(View::LEVEL_ACTION_VIEW);
                    }
                );
                //echo $this->view->getContent();
                return 1;
            }
        }
    }
    /**
     * Retrieve a list of Posts for a specific tags id.
     *
     * @param int    $id       The Tags ID
     * @param string $slugTags
     *
     * @return array list of posts
     */
    public function postByTagAction($id, $slugName)
    {
        $join = [
            'type'  => 'join',
            'model' => 'Phanbook\\Models\\PostsTags',
            'on'    => 'pt.postsId = p.id',
            'alias' => 'pt'

        ];
        /**@Todo later for security*/
        $Where  = 'p.deleted = 0 AND pt.tagsId = ' .$id;
        list($itemBuilder, $totalBuilder) = $this->prepareQueries($join, $Where, self::ITEM_IN_PAGE);
        //$itemBuilder->andWhere($conditions);
        $page       = isset($_GET['page'])?(int)$_GET['page']:1;
        $totalPosts = $totalBuilder->getQuery()->setUniqueRow(true)->execute();
        $totalPages = ceil($totalPosts->count / self::ITEM_IN_PAGE);

        if ($page > 1) {
            $itemBuilder->offset((int) $page);
        }

        $this->view->setVars(
            [
                'tab'  => 'tags',
                'object'        => $itemBuilder->getQuery()->execute(),
                'totalPages'    => $totalPages,
                'currentPage'   => $page,
                'slugName'      => $slugName,
                'hotPosts'      => Posts::getHotPosts()
            ]
        );
        $this->tag->setTitle(t('These posts fillter by tags'));
        return $this->view->pick('post');
    }
}
