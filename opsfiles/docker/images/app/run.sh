#!/bin/bash
echo ">>Install composer"

if [[ ! -d "vendor" ]]; then
    php composer.phar install --no-ansi --no-dev --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -d "vendor" && "$ENV" == "development" ]]; then
    php composer.phar install --no-ansi --no-interaction --no-progress --no-scripts --optimize-autoloader
fi
if [[ ! -f "core/config/config.php" ]]; then
    cp core/config/config.example.php core/config/config.php
fi


chmod 777 -R content
chown nginx:nginx -R .

