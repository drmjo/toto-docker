php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"

chmod 744 composer.phar
mv composer.phar /usr/bin/composer

cd /var/www/symfony
composer install

php app/console doctrine:migrations:migrate --no-interaction
php app/console doctrine:fixtures:load --no-interaction

php5-fpm -F
