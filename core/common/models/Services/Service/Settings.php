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
namespace Phanbook\Models\Services\Service;

use Phanbook\Models\Services\Service;
use Phanbook\Models\Settings as Entity;
use Phanbook\Models\Services\Exceptions\EntityNotFoundException;

/**
 * \Phanbook\Models\Services\Service\Settings
 *
 * @package Phanbook\Models\Services\Service
 */
class Settings extends Service
{
    /**
     * Finds Settings by name.
     *
     * @param  string $name The setting name.
     * @return Entity|null
     */
    public function findFirstByName($name)
    {
        return Entity::findFirstByName($name) ?: null;
    }

    /**
     * Get Settings by ID.
     *
     * @param  string $name The setting name.
     * @return Entity
     *
     * @throws EntityNotFoundException
     */
    public function getFirstByName($name)
    {
        if (!$entity = $this->findFirstByName($name)) {
            throw new EntityNotFoundException($name, 'name');
        }

        return $entity;
    }

    /**
     * Get Google Analytics top activities from the database.
     *
     * @return mixed
     */
    public function getListTopActivity()
    {
        if (!$value = $this->findSetting('googleAnalyticTopActivities')) {
            $value = json_encode([]);
        }

        return json_decode($value);
    }

    /**
     * Finds Google Analytics access token from the database.
     *
     * @return string|null
     */
    public function findAccessToken()
    {
        return $this->findSetting('googleAnalyticAccessToken');
    }

    /**
     * Finds Google Analytics refresh token from the database.
     *
     * @return string|null
     */
    public function findRefreshToken()
    {
        return $this->findSetting('googleAnalyticRefreshToken');
    }

    /**
     * Finds Google Analytics tracking id from the database.
     *
     * @return string|null
     */
    public function findAnalyticTrackingID()
    {
        return $this->findSetting('googleAnalyticTrackingId');
    }

    /**
     * Finds Google Analytics profile id from the database.
     *
     * @return string|null
     */
    public function findAnalyticProfileID()
    {
        return $this->findSetting('googleAnalyticProfileId');
    }

    /**
     * Finds Google Analytics account id from the database.
     *
     * @return string|null
     */
    public function findAnalyticAccountID()
    {
        return $this->findSetting('googleAnalyticAccountId');
    }

    /**
     * Check Google Analytics access token.
     *
     * @return bool
     */
    public function hasAccessToken()
    {
        return (bool) $this->findSetting('googleAnalyticAccessToken');
    }

    /**
     * Sets Google Analytics access token to the database.
     *
     * @param  string $token The Google Analytics access token
     * @return bool
     */
    public function setAccessToken($token)
    {
        return $this->saveSitting('googleAnalyticAccessToken', $token);
    }

    /**
     * Set Google Analytics refresh token to the database.
     *
     * @param  string $token The Google Analytics refresh token.
     * @return bool
     */
    public function setRefreshToken($token)
    {
        return $this->saveSitting('googleAnalyticRefreshToken', $token);
    }

    /**
     * Sets Google Analytics tracking id to the database.
     *
     * @param  string $trackingId The Google Analytics tracking id.
     * @return bool
     */
    public function setAnalyticTrackingID($trackingId)
    {
        return $this->saveSitting('googleAnalyticTrackingId', $trackingId);
    }

    /**
     * Sets Google Analytics profile id to the database.
     *
     * @param  string $profileId The Google Analytics profile id.
     * @return bool
     */
    public function setAnalyticProfileID($profileId)
    {
        return $this->saveSitting('googleAnalyticProfileId', $profileId);
    }

    /**
     * Sets Google Analytics profile id to the database.
     *
     * @param  string $accountId The Google Analytics account id.
     * @return bool
     */
    public function setAnalyticAccountID($accountId)
    {
        return $this->saveSitting('googleAnalyticAccountId', $accountId);
    }

    /**
     * Sets Google Analytics top activities to the database.
     *
     * @param  array $topActivity
     * @return bool
     */
    public function setListTopActivity(array $topActivity)
    {
        $listTopActivity = $this->getListTopActivity();

        for ($i = 0; $i < count($listTopActivity); $i++) {
            $listTopActivity[$i]->default = 0;
            foreach ($topActivity as $key => $element) {
                if ($listTopActivity[$i]->code == $element) {
                    $listTopActivity[$i]->default = 1;
                }
            }
        }

        $listTopActivity = json_encode($listTopActivity, JSON_NUMERIC_CHECK);

        return $this->saveSitting('googleAnalyticTopActivities', $listTopActivity);
    }

    /**
     * Validate Google Analytics settings
     */
    public function validateGoogleSettings()
    {
        $array = [
            'googleAnalyticAccessToken',
            'googleAnalyticRefreshToken',
            'googleAnalyticProfileId',
            'googleAnalyticAccountId',
            'googleAnalyticTrackingId',
            'googleAnalyticTopActivities',
        ];

        foreach ($array as $value) {
            try {
                $this->getFirstByName($value);
            } catch (EntityNotFoundException $e) {
                $this->logger->error($e->getMessage());
                if ($this->getDI()->has('menuStruct')) {
                    $view = $this->getDI()->getShared('view');
                    $view->partial(
                        'errors/model',
                        [
                            'name'       => $value ,
                            'menuStruct' => $this->getDI()->getShared('menuStruct'),
                            'model'      => Entity::class
                        ]
                    );
                }
            }
        }
    }

    /**
     * Save settings to the database.
     *
     * @param string $name
     * @param mixed  $value
     *
     * @return bool
     */
    protected function saveSitting($name, $value)
    {
        if ($entity = $this->findFirstByName($name)) {
            $entity->setValue($value);
            if ($result = $entity->save()) {
                $messages = $entity->getMessages();
                $this->logger->error(
                    sprintf('%s:%s %s', __FILE__, __LINE__, implode('; ', $messages))
                );
            }

            return $result;
        }

        return false;
    }

    /**
     * Finds settings from the database.
     *
     * @param  string $name
     * @return mixed|null
     */
    protected function findSetting($name)
    {
        $entity = $this->findFirstByName($name);

        if ($entity) {
            return $entity->getValue() ?: null;
        }

        return null;
    }

    /**
     * Clear Google Analytics Auth.
     *
     * @return void
     */
    public function clearGoogleAuth()
    {
        $this->setAccessToken('');
        $this->setRefreshToken('');
        $this->setAnalyticAccountID('');
        $this->setAnalyticProfileID('');
        $this->setAnalyticTrackingID('');
    }
}
