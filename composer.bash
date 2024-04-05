#!/bin/sh

curl -sS https://getcomposer.org/installer | php -- --filename=composer.php
chmod +x composer.php
php composer.php req -n -o phpstan/phpstan:${PHP_PHPSTAN_VERSION}
chmod -Rf +rwx /vendor/
rm -f composer.php composer.bash composer.json composer.lock
