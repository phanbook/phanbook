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
namespace Phanbook\Controllers\Admin;

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Db\Adapter\Pdo;
use Phalcon\Paginator\Adapter\NativeArray as Paginator;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * Class ControllerBase
 */
class ControllerBase extends Controller
{
    /**
     * @var array
     */
    private $securedRoutes = [
        ['controller' => 'admin'],
        ['controller' => 'template'],
        ['controller' => 'posts'],
        ['controller' => 'settings'],
        ['controller' => 'pages'],
        ['controller' => 'users'],
        ['controller' => 'tags'],
        ['controller' => 'dashboard'],
        ['controller' => 'update'],
        ['controller' => 'tests'],

    ];
    /**
     * @var array
     */
    protected static $grid = [];

    /**
     * @var array
     */
    protected static $query = [];
    /**
     * @var array
     */
    private $gridFilters = [];

    /**
     * @var bool
     */
    protected $jsonResponse = false;

    /**
     * @var array
     */
    public $jsonMessages = [];
    /**
     * @var int
     */
    public $numberPage = 1;

    /**
     * @var int
     */
    public $perPage = 10;

    protected $gridActions = ['delete' => 'delete', 'disable' => 'toggleObject'];
    /**
     * @var string
     */
    public $currentOrder = null;

    /**
     * Check if we need to throw a json respone. For ajax calls.
     *
     * @return bool
     */
    public function isJsonResponse()
    {
        return $this->jsonResponse;
    }

    /**
     * Set a flag in order to know if we need to throw a json response.
     *
     * @return $this
     */
    public function setJsonResponse()
    {
        $this->jsonResponse = true;

        return $this;
    }

    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    public function beforeExecuteRoute(Dispatcher $dispatcher)
    {
        // @todo something
        if ($this->auth->isAdmin() && $this->isSecuredRoute($dispatcher)) {
            return true;
        }
        return $this->response->redirect();
    }


    /**
     * After execute route event
     *
     * @param Dispatcher $dispatcher
     */
    public function afterExecuteRoute(Dispatcher $dispatcher)
    {
        if ($this->request->isAjax() && $this->isJsonResponse()) {
            $this->view->disable();
            $this->response->setContentType('application/json', 'UTF-8');

            $data = $dispatcher->getReturnedValue();
            if (is_array($data)) {
                $this->response->setJsonContent($data);
            }
            echo $this->response->getContent();
        }
        $this->view->setViewsDir($this->view->getViewsDir() . 'admin/');
    }

    public function initialize()
    {
        $this->view->currentOrder = $this->currentOrder;
        $this->view->setTemplateBefore('admin');
        $this->loadDefaultAssets();
    }
    /**
     * loadDefaultAssets function.
     *
     * @access private
     * @return void
     */
    private function loadDefaultAssets()
    {
        if ($this->config->application->debug) {
            //Add assets to for develop
            $this->assets
                ->addCss('//fonts.googleapis.com/css?family=Open+Sans', false)
                ->addCss('https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css', false)
                ->addCss('backend/css/animate.css')
                ->addCss('backend/css/icon.css')
                ->addCss('backend/css/app.v1.css')
                ->addCss('backend/css/app-custom.css');
            $this->assets
                ->addJs('//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js', false)
                ->addJs('//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js', false)
                ->addJs('//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js', false)
                ->addJs('backend/js/growl/jquery.growl.js')
                ->addJs('backend/js/jquery.taginput.src.js')
                ->addJs('backend/js/chosen/chosen.jquery.min.js')
                ->addJs('backend/js/app.js')
                ->addJs('backend/js/app.plugin-custom.js');
        } else {
            //@todo Add assets to product
            $this->assets
                ->addCss('//fonts.googleapis.com/css?family=Open+Sans', false)
                ->addCss('https://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css', false)
                ->addCss('backend/css/animate.css')
                ->addCss('backend/css/icon.css')
                ->addCss('backend/css/app.v1.css')
                ->addCss('backend/css/app-custom.css');
            $this->assets
                ->addJs('//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js', false)
                ->addJs('//ajax.googleapis.com/ajax/libs/jqueryui/1.10.2/jquery-ui.min.js', false)
                ->addJs('//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js', false)
                ->addJs('backend/js/growl/jquery.growl.js')
                ->addJs('backend/js/jquery.taginput.src.js')
                ->addJs('backend/js/chosen/chosen.jquery.min.js')
                ->addJs('backend/js/app.js')
                ->addJs('backend/js/app.plugin-custom.js');
        }
    }


    /**
     * @param Dispatcher $dispatcher
     *
     * @return bool
     */
    private function isSecuredRoute(Dispatcher $dispatcher)
    {
        foreach ($this->securedRoutes as $route) {
            if ($route['controller'] == $dispatcher->getControllerName()) {
                return true;
            }
        }

        return false;
    }

    /**
     * Set a flash message with messages from objects
     *
     * @param $object
     */
    public function displayModelErrors($object)
    {
        if (is_object($object) && method_exists($object, 'getMessages')) {
            foreach ($object->getMessages() as $message) {
                $this->flashSession->error($message);
            }
        } else {
            $this->flashSession->error(t('No object found. No errors.'));
        }
    }


    public function toggleAction($id)
    {
        $this->view->disable();
        if ($this->toggleObject($id)) {
            $this->flashSession->success(t('Entry status changed successfully'));
        } else {
            $this->flashSession->error(t('An error occurred on changing entry status'));
        }

        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    /**
     * Method to toggle objects
     *
     * @return mixed
     */
    private function toggleObject($id, $method = 'status')
    {
        $class = 'Phanbook\Models\\' . ucfirst($this->router->getControllerName());

        if (!class_exists($class)) {
            return false;
        }

        $id     = $this->filter->sanitize($id, ['int']);
        $object = $class::findFirstById($id);

        if (!is_object($object)) {
            return false;
        }
        $setter = 'set' . ucfirst($method);
        $getter = 'get' . ucfirst($method);

        if (!method_exists($object, $getter) || !method_exists($object, $setter)) {
            return false;
        }

        $value = $object->$getter() == 0 ? 1 : 0;
        $object->$setter($value);

        return $object->save();
    }

    /**
     * Method to delete objects
     *
     * @return mixed
     */
    private function delete($id, $model = null)
    {
        $this->view->disable();

        if (empty($model)) {
            $class = 'Phanbook\Models\\' . ucfirst($this->router->getControllerName());
        }

        if (!class_exists($class)) {
            return false;
        }

        if (is_array($id)) {
            $ids    = array_map(
                function ($key) {
                    return (int)$key;
                },
                $id
            );
            $object = $class::find('id IN (' . implode(',', $ids) . ')');
        } else {
            $id     = $this->filter->sanitize($id, ['int']);
            $object = $class::findFirstById($id);
        }
        if (!$object) {
            $this->flashSession->error(t('Entry was not found'));

            return $this->response->redirect($this->request->getHTTPReferer(), true);
        }

        if (!$object->delete()) {
            foreach ($object->getMessages() as $message) {
                $this->flashSession->error($message->getMessage());
            }
        } else {
            $this->flashSession->success(t('Entry was successfully deleted'));
        }

        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    public function deleteAction($id)
    {
        $this->view->disable();

        return $this->delete($id);
    }



    /**
     * Attempt to determine the real file type of a file.
     *
     * @param string $extension Extension (eg 'jpg')
     *
     * @return boolean
     */
    public function imageCheck($extension)
    {
        $allowedTypes = [
            'image/gif',
            'image/jpg',
            'image/png',
            'image/bmp',
            'image/jpeg',
            'image/x-icon'
        ];

        return in_array($extension, $allowedTypes);
    }


    /**
     * This method prepares the queries to be executed in each list of posts
     * The returned builders are used as base in the search, tagged list and index lists.
     *
     * @param array  $join  The Model need to join {code} $join = [ 'type'  => 'join', 'model' => 'Phanbook\\Models\\PostsReply', 'on'    => 'r.postsId = p.id', 'alias' => 'r' ]; {/code} {code} $join = [ 'type'  => 'join', 'model' => 'Phanbook\\Models\\PostsReply', 'on'    => 'r.postsId = p.id', 'alias' => 'r' ]; {/code}
     * {code}
     * $join = [
     *   'type'  => 'join',
     *   'model' => 'Phanbook\\Models\\PostsReply',
     *   'on'    => 'r.postsId = p.id',
     *   'alias' => 'r'
     * ];
     * {/code}
     * @param string $where The condition you want to get.
     * @param int    $limit The option limit post in a page.
     *
     * @return array It return two object
     */
    protected function prepareQueries($join, $where, $limit = 15)
    {
        $itemBuilder = $this
            ->modelsManager
            ->createBuilder()
            ->from(['p' => 'Phanbook\Models\Posts'])
            ->orderBy('p.sticked DESC, p.createdAt DESC');

        if (isset($join) && is_array($join)) {
            $itemBuilder->$join['type']($join['model'], $join['on'], $join['alias']);
        }
        if (isset($where)) {
            $itemBuilder->where($where);
        }

        $totalBuilder = clone $itemBuilder;

        $itemBuilder
            ->columns(array('p.*'))
            ->limit($limit);

        $totalBuilder
            ->columns('COUNT(*) AS count');

        return array($itemBuilder, $totalBuilder);
    }
    /**
     * Create a QueryBuilder paginator, show 15 rows by page starting from $page
     *
     * @param array $model The model need to retrieve and someoption {code} $mode = [ 'name'      => 'Phanbook\Models\Users' 'orderBy'   => 'username' 'currentOrder'=> 'users'// mean adding class for menu ] {/code}
     * {code}
     *      $mode = [
     *          'name'      => 'Phanbook\Models\Users'
     *          'orderBy'   => 'username'
     *          'currentOrder'=> 'users'// mean adding class for menu
     *      ]
     * {/code}
     * @param int   $page  Current page to show
     *
     * @return array the conatainer object...
     */
    public function paginatorQueryBuilder($model, $page)
    {
        $builder = $this->modelsManager->createBuilder()
            ->from($model['name'])
            ->orderBy($model['orderBy']);
        //Create a Model paginator, show 15 rows by page starting from $page
        $paginator   = (new PaginatorQueryBuilder(
            [
                'builder'  => $builder,
                'limit'     => self::ITEM_IN_PAGE,
                'page'      => $page
            ]
        ))->getPaginate();
        $this->view->setVars(
            [
            'currentOrder'  => $model['currentOrder'],
            'object'        => $paginator->items,
            'canonical'     => '',
            'totalPages'    => $paginator->total_pages,
            'currentPage'   => $page,
            ]
        );
    }
    public function indexRedirect()
    {
        return $this->response->redirect($this->getPathController());
    }
    public function currentRedirect()
    {
        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }
    public function getPathController()
    {
        return 'admin/' . $this->router->getControllerName();
    }

    //@todo : refactor gridAction !
    /**
     * @return bool|\Phalcon\Http\ResponseInterface
     */
    public function gridAction()
    {
        if (empty(self::$grid)) {
            static::setGrid();
        }

        $this->view->disable();
        $model = str_replace('admin', '', $this->router->getControllerName());

        $class = 'Phanbook\Models\\' . ucfirst($model);

        if (!class_exists($class)) {
            return false;
        }

        $this->gridFilters = $this->getGridFilters();

        //order
        $orderby = $this->request->getPost('orderBy');
        $order   = 'a.id';
        if (array_key_exists($orderby, static::$grid['grid'])) {
            if (!empty(static::$grid['grid'][$orderby]['orderKey'])) {
                $order = static::$grid['grid'][$orderby]['orderKey'];
            } else {
                $order = $orderby;
            }
        }

        $way = in_array(strtolower($this->request->getPost('orderWay')), ['asc', 'desc'])
            ? $this->request->getPost('orderWay')
            : 'ASC';

        $filterKey                              = $this->router->getControllerName();
        $this->gridFilters[$filterKey]['order'] = $order . ' ' . $way;

        //paginator
        $this->numberPage = $this->request->getPost("page", "int");
        if ($this->numberPage <= 0) {
            $this->numberPage = 1;
        }
        $this->gridFilters[$filterKey]['page'] = $this->numberPage;

        //per page
        if ($this->request->getPost('perPage') && in_array(
            $this->request->getPost('perPage'),
            10 //items per page.
        )
        ) {
            $this->perPage = $this->request->getPost('perPage');
        }
        $this->gridFilters[$filterKey]['perPage'] = $this->perPage;

        //filters
        $post = array_filter($_POST);

        //reset last filters
        $this->gridFilters[$filterKey]['conditions']           = null;
        $this->gridFilters[$filterKey]['conditions']['having'] = 1;

        foreach ($post as $k => $v) {
            if (!array_key_exists($k, self::$grid['grid'])) {
                continue;
            }
            if (!empty(self::$grid['grid'][$k]['filterKey'])) {
                $column = self::$grid['grid'][$k]['filterKey'];
            } else {
                $column = $k;
            }
            //@todo : refactor conditions.
            if (isset(self::$grid['grid'][$k]['having'])) {
                $this->gridFilters[$filterKey]['conditions']['having'] .= ' AND ' .
                    $k .
                    (self::$grid['grid'][$k]['filter']['sanitize'] == 'string' ? ' LIKE \'%' . $v . '%\'' : ' = \'' . $v . '\'');
            } else {
                $this->gridFilters[$filterKey]['conditions']['conditions'][] =
                    [
                        $column . (self::$grid['grid'][$k]['filter']['sanitize'] == 'string' ? ' LIKE ' : ' = ') . ':' . $k . ':',
                        [$k => self::$grid['grid'][$k]['filter']['sanitize'] == 'string' ? '%' . $v . '%' : $v],
                        [$k => (self::$grid['grid'][$k]['filter']['sanitize'] == 'int' ? \PDO::PARAM_INT : (self::$grid['grid'][$k]['filter']['sanitize'] == 'string' ? \PDO::PARAM_STR : \PDO::PARAM_BOOL))]
                    ];
            }
        }

        $this->gridFilters[$filterKey]['post'] = $post;

        //reset saved filters
        if ($this->request->getPost('resetFilter')) {
            if (!empty($this->gridFilters[$filterKey])) {
                unset($this->gridFilters[$filterKey]);
            }
        }

        $this->saveGridFilters();

        //@todo : refactor this crap !!!
        return $this->response->redirect($this->request->getHTTPReferer());
    }

    //@todo : refactor renderGrid !

    /**
     * parseGridSubmit function.
     *
     * @access public
     * @return mixed
     */
    protected function renderGrid($class)
    {
        $filterKey  = $this->router->getControllerName();
        $conditions = [];

        $this->gridFilters = $this->getGridFilters();

        if (!empty($this->gridFilters[$filterKey]['conditions'])) {
            $conditions = $this->gridFilters[$filterKey]['conditions'];
        }
        /*
        if (isset($conditions['having']) && $conditions['having'] == 1) {
            unset($conditions['having']);
        }
        */
        $builder = $this->modelsManager->createBuilder($conditions);
        $builder->from(['a' => $class]);

        if (!empty(self::$grid['query'])) {
            if (!empty(self::$grid['query']['columns'])) {
                $builder->columns(self::$grid['query']['columns']);
            }
            foreach (self::$grid['query']['joins'] as $join) {
                if (in_array($join['type'], ['innerJoin', 'leftJoin', 'rightJoin', 'join'])) {
                    $builder->$join['type']($join['model'], $join['on'], $join['alias']);
                }
            }
            if (!empty(self::$grid['query']['groupBy'])) {
                $builder->groupBy(self::$grid['query']['groupBy']);
            }
        }

        if (!empty($this->gridFilters[$filterKey]['order'])) {
            $builder->orderBy($this->gridFilters[$filterKey]['order']);
        }

        $collections = $builder->getQuery()->execute()->toArray();

        if (!count($collections)) {
            if (!$this->request->isAjax()) {
                $this->flashSession->notice(t("The search did not match any collection."));
            } else {
                /*
                $this->setJsonResponse();
                $this->jsonMessages['messages'][] = ['type'    => 'notice',
                                                     'content' => t('The search did not match any collection.')
                ];
                */
                //return $this->jsonMessages;
            }
        }

        $this->assets->addCss('backend/js/chosen/chosen.css');
        $this->assets->addJs('backend/js/datatables/jquery.dataTables.min.js');

        $paginator = new Paginator(
            [
                'data'  => $collections,
                'limit' => (empty($this->gridFilters[$filterKey]['perPage']) ? $this->perPage : $this->gridFilters[$filterKey]['perPage']),
                'page'  => (empty($this->gridFilters[$filterKey]['page']) ? $this->numberPage : $this->gridFilters[$filterKey]['page'])
            ]
        );

        // Passing variables to view
        $this->view->setVars(
            [
                'paginator' => $paginator->getPaginate(),
                'filters'   => (!empty($this->gridFilters[$filterKey]['post']) ? $this->gridFilters[$filterKey]['post'] : []),
                'perPage'   => (empty($this->gridFilters[$filterKey]['perPage']) ? $this->perPage : $this->gridFilters[$filterKey]['perPage']),
                'params'    => static::$grid,
            ]
        );
    }

    /**
     * Save in Session or cookie an array with parameters for grid filters and pagination.
     *
     * @param array $values
     */
    private function saveGridFilters($values = [])
    {
        $filters = $this->gridFilters;
        if (!empty($values)) {
            $filters = [$this->router->getControllerName() => $values];
        }

        $this->cookies->set('gridFilters', serialize($filters), time() + 30 * 86400); //30 days
    }

    /**
     * Returns uncrypted and unserialised array with parameters for grid filters and pagination.
     *
     * @param bool $key
     *
     * @return bool|mixed
     */
    private function getGridFilters($key = false)
    {
        if ($this->cookies->has('gridFilters')) {
            $cookieValue = unserialize($this->cookies->get('gridFilters')->getValue());
            if ($key) {
                if (!empty($cookieValue[$key])) {
                    return $cookieValue[$key];
                }
            } else {
                return $cookieValue;
            }
        }

        return false;
    }
}
