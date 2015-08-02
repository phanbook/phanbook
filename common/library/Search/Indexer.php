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
namespace Phanbook\Search;

use Phalcon\DI\Injectable;
use Elasticsearch\Client;
use Phanbook\Models\Posts;

/**
 * Indexer
 *
 * This component uses ElasticSearch to search items in the Phanbook
 */
class Indexer extends Injectable
{
    /**
     * Index a document
     * @var string
     */
    protected $index = 'phanbook';

    /**
     * Type a document
     * @var string
     */
    protected $type = 'posts';

    public function __construct()
    {
        $config = Injectable::getDI()->getConfig();
        $this->index = $config->elasticsearch->index;
        $this->type  = $config->elasticsearch->type;
    }
    /**
     * Search documents in ElasticSearch by the specified criteria
     *
     * @param array   $fields
     * @param int     $limit
     * @param boolean $returnPosts
     */
    public function search(array $fields, $limit = 10, $returnPosts = false)
    {
        try {
            $client = new Client();

            $searchParams['index'] = $this->index;
            $searchParams['type']  = $this->type;

            $searchParams['body']['fields'] = array('id', 'karma');

            if (count($fields) == 1) {
                $searchParams['body']['query']['match'] = $fields;
            } else {
                $terms = array();
                foreach ($fields as $field => $value) {
                    $terms[] = array('term' => array($field => $value));
                }
                $searchParams['body']['query']['bool']['must'] = $terms;
            }

            $searchParams['body']['from'] = 0;
            $searchParams['body']['size'] = $limit;

            $queryResponse = $client->search($searchParams);

            $results = [];
            if (is_array($queryResponse['hits'])) {
                $d = 0.5;
                foreach ($queryResponse['hits']['hits'] as $hit) {
                    $post = Posts::findFirstById($hit['fields']['id'][0]);
                    if ($post) {
                        if ($hit['fields']['karma'][0] > 0 && ($post->getNumberReply() > 0 || $post->getAcceptedAnswer() == 'Y')) {
                            $score = $hit['_score'] * 250 + $hit['fields']['karma'][0] + $d;
                            if (!$returnPosts) {
                                $results[$score] = array(
                                    'slug'    => 'posts/' . $post->getId() . '/' . $post->getSlug(),
                                    'title'   => $post->getTitle(),
                                    'created' => $post->getHumanCreatedAt()
                                );
                            } else {
                                $results[$score] = $post;
                            }
                            $d += 0.05;
                        }
                    }
                }
            }

            krsort($results);

            return array_values($results);
        } catch (\Exception $e) {
            return array();
        }
    }

    /**
     * Index a single document
     *
     * @param Client $client
     * @param Posts  $post
     */
    protected function _doIndex($client, $post)
    {
        $karma = $post->getNumberViews() + 0 + $post->getNumberReply();
        if ($karma > 0) {
            $params = [];
            $params['body']  = [
                'id'       => $post->getId(),
                'title'    => $post->getTitle(),
                //'category' => $post->categories_id,
                'content'  => $post->getContent(),
                'karma'    => $karma
            ];
            $params['index'] = $this->index;
            $params['type']  = $this->type;
            $params['id']    = 'post-' . $post->getId();
            $ret = $client->index($params);
            var_dump($ret);
        }
    }

    public function searchCommon()
    {
        $client = new Client();

        $searchParams['index'] = $this->index;
        $searchParams['type']  = $this->type;

        $searchParams['body']['common']['body']['fields'] = array('id', 'karma');
        $searchParams['body']['common']['body']['query'] = "nelly the elephant not as a cartoon";
        $searchParams['body']['common']['body']["cutoff_frequency"] = 0.001;

        $queryResponse = $client->search($searchParams);
    }

    /**
     * Puts a post in the search server
     *
     * @param Posts $post
     */
    public function index($post)
    {
        $client = new Client();
        $this->_doIndex($client, $post);
    }

    /**
     * Indexes all posts in the forum in ES
     */
    public function indexAll()
    {
        $client = new Client();

        try {
            $deleteParams['index'] = $this->index;
            $client->indices()->delete($deleteParams);
        } catch (\Exception $e) {
            // the index does not exist yet
        }

        foreach (Posts::find('deleted != 1') as $post) {
            $this->_doIndex($client, $post);
        }
    }
}
