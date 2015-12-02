#!/usr/bin/env bash
#cp app/config/config.example.php app/config/config.php
echo ">>Install composer"
cd "${ROOT_DIR}"

if [[ ! -d "vendor" && "$ENV" == "production" ]]; then
    php composer.phar install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -d "vendor" && "$ENV" == "development" ]]; then
    php composer.phar install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -f "core/config/config.php" && "$ENV" == "development" ]]; then
    cp core/config/config.vagrant.php core/config/config.php
fi
if [[ ! -f "core/config/config.php" && "$ENV" == "production" ]]; then
    cp core/config/config.example.php core/config/config.php
fi
#sed -i "s/'host'     => 'db'/'host'     => 'localhost'/" core/config/config.vagrant.php

chmod 777 -R content/

