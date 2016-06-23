php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"

chmod 744 composer.phar
mv composer.phar /usr/bin/composer

cd /var/www/symfony
php app/console doctrine:database:create
composer install

php5-fpm -F
