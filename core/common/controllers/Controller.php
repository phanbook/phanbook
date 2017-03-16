<?php
/**
 * Phanbook : Delightfully simple forum and Q&A software
 *
 * Licensed under The BSD License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @link    http://phanbook.com Phanbook Project
 * @since   1.0.0
 * @author  Phanbook <hello@phanbook.com>
 * @license https://github.com/phanbook/phanbook/blob/master/LICENSE.txt
 */
namespace Phanbook\Controllers;

use Phalcon\Mvc\Dispatcher;
use Phanbook\Models\ModelBase;
use Phalcon\Paginator\Adapter\Model as PaginatorModel;
use Phalcon\Paginator\Adapter\NativeArray as PaginatorNativeArray;
use Phalcon\Paginator\Adapter\QueryBuilder as PaginatorQueryBuilder;

/**
 * \Phanbook\Controllers\Controller
 *
 * @property \Phanbook\Auth\Auth $auth
 * @property \Phalcon\Logger\Adapter\File $logger
 * @property \Phanbook\Common\Library\Acl\Manager $aclManager
 *
 * @package Phanbook\Controllers
 */
class Controller extends AbstractController
{
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

    /**
     * @var array
     */
    protected $gridActions = ['delete' => 'delete', 'disable' => 'toggleObject'];

    /**
     * @var string
     */
    public $currentOrder = null;

    /**
     * @var int
     */
    protected $statusCode = 200;

    /**
     * Check if we need to throw a json response. For ajax calls.
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
    }

    /**
     * Set a flash message with messages from objects
     *
     * @todo Move to the trait
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
            $model = $this->router->getControllerName();
            //Because controller pages use model posts render data
            if ($model == 'pages') {
                $model = 'posts';
            }

            $class = 'Phanbook\Models\\' . ucfirst($model);
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

    /**
     * @param $id
     * @return mixed
     */
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
     * Create a QueryBuilder paginator, show 15 rows by page starting from $page
     *
     * @param array $model The model need to retrieve and some option
     * {code}
     *      $mode = [
     *          'name'      => 'Users'
     *          'orderBy'   => 'username'
     *          'currentOrder'=> 'users'// mean adding class for menu
     *      ]
     * {/code}
     * @param int   $page  Current page to show
     *
     * @return array the container object...
     */
    public function paginatorQueryBuilder($model, $page)
    {
        $builder = $this->modelsManager->createBuilder()
            ->from('Phanbook\\Models\\' . $model['name'])
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

    /**
     * \Phalcon\Paginator\AdapterInterface
     *
     * Create a pagination default use adapter pagination QueryBuilder,
     * show 30 rows by page starting from $page
     *
     * @return array
     */
    public function paginator($query)
    {
        $page    = $this->request->getQuery('page') ? : 1;
        $perPage = $this->request->getQuery('limit') ? : $this->perPage;

        if (is_object($query)) {
            $paginator = new PaginatorModel([
                'data' => $query,
                'limit' => $perPage,
                'page' => $page
            ]);
        } elseif (isset($query['model'])) {
            $builder  = ModelBase::modelQuery($query);
            $paginator  = new PaginatorQueryBuilder(
                [
                    'builder'   => $builder,
                    'limit'     => $perPage,
                    'page'      => $page
                ]
            );
        } else {
            $paginator = new PaginatorNativeArray([
                'data' => $query,
                'limit' => $perPage,
                'page' => $page
            ]);
        }
        return $paginator;
    }

    /**
     * @return \Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    public function indexRedirect()
    {
        return $this->response->redirect($this->getPathController());
    }

    /**
     * @todo Move to the trait
     * @return \Phalcon\Http\Response|\Phalcon\Http\ResponseInterface
     */
    protected function currentRedirect()
    {
        if ($url = $this->cookies->get('urlCurrent')->getValue()) {
            $this->cookies->delete('urlCurrent');
            return $this->response->redirect($url);
        }
        return $this->response->redirect($this->request->getHTTPReferer(), true);
    }

    public function getPathController()
    {
        return $this->router->getControllerName();
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
        $model = $this->router->getControllerName();
        //Because controller pages use model posts render data
        if ($model == 'pages') {
            $model = 'posts';
        }
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
            $this->perPage //items per page.
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
                    (self::$grid['grid'][$k]['filter']['sanitize']
                    == 'string' ? ' LIKE \'%' . $v . '%\'' : ' = \'' . $v . '\'');
            } else {
                $this->gridFilters[$filterKey]['conditions']['conditions'][] =
                    [
                        $column . (self::$grid['grid'][$k]['filter']['sanitize']
                            == 'string' ? ' LIKE ' : ' = ') . ':' . $k . ':',
                        [$k => self::$grid['grid'][$k]['filter']['sanitize']
                            == 'string' ? '%' . $v . '%' : $v],
                        [$k => (self::$grid['grid'][$k]['filter']['sanitize']
                            == 'int' ? \PDO::PARAM_INT : (self::$grid['grid'][$k]['filter']['sanitize']
                            == 'string' ? \PDO::PARAM_STR : \PDO::PARAM_BOOL))]
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
     * @param  string $class Model class.
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
        $builder->from(['a' => 'Phanbook\\Models\\' . $class]);

        if (!empty(self::$grid['query'])) {
            if (!empty(self::$grid['query']['columns'])) {
                $builder->columns(self::$grid['query']['columns']);
            }
            foreach (self::$grid['query']['joins'] as $join) {
                $type = (string) $join['type'];
                if (in_array($type, ['innerJoin', 'leftJoin', 'rightJoin', 'join'])) {
                    $builder->$type('Phanbook\\Models\\' . $join['model'], $join['on'], $join['alias']);
                }
            }
            if (!empty(self::$grid['query']['groupBy'])) {
                $builder->groupBy(self::$grid['query']['groupBy']);
            }
            if (!empty(self::$grid['query']['where'])) {
                $builder->where(self::$grid['query']['where']);
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

        $paginator = new PaginatorNativeArray(
            [
                'data'  => $collections,
                'limit' => (empty($this->gridFilters[$filterKey]['perPage']) ?
                            $this->perPage : $this->gridFilters[$filterKey]['perPage']),
                'page'  => (empty($this->gridFilters[$filterKey]['page']) ?
                            $this->numberPage : $this->gridFilters[$filterKey]['page'])
            ]
        );

        // Passing variables to view
        $this->view->setVars(
            [
                'paginator' => $paginator->getPaginate(),
                'filters'   => (!empty($this->gridFilters[$filterKey]['post']) ?
                                $this->gridFilters[$filterKey]['post'] : []),
                'perPage'   => (empty($this->gridFilters[$filterKey]['perPage']) ?
                                 $this->perPage : $this->gridFilters[$filterKey]['perPage']),
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
        if (!$this->cookies->has('gridFilters')) {
            return false;
        }

        $cookieValue = unserialize($this->cookies->get('gridFilters')->getValue());
        if ($key) {
            if (!empty($cookieValue[$key])) {
                return $cookieValue[$key];
            }
        } else {
            return $cookieValue;
        }
    }

    /**
     * The function sending log for nginx or apache, it will to analytic later
     *
     * @param $e
     */
    public function saveLogger($e)
    {

        $logger = $this->logger;
        if (is_object($e)) {
            $logger->error($e[0]->getMessage());
        }
        if (is_array($e)) {
            foreach ($e as $message) {
                $logger->error($message->getMessage());
            }
        }
        if (is_string($e)) {
            $logger->error($e);
        }
    }

    public function onConstruct()
    {
        $this->view->setVars([
            'auth'          => $this->auth->getAuth(),
            'name'          => $this->config->application->name,
            'publicUrl'     => $this->config->application->publicUrl,
            'action'        => $this->router->getActionName(),
            'controller'    => $this->router->getControllerName(),
            'baseUri'       => $this->config->application->baseUri,
            'googleAnalytic'=> $this->config->googleAnalytic

        ]);
    }
}
