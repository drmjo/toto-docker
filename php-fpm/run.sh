set -x

cd /var/www/symfony

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php
php -r "unlink('composer-setup.php');"

chmod 744 composer.phar

# su
# mv composer.phar /usr/bin/composer
# su -l www-data

./composer.phar install

php app/console doctrine:migrations:migrate --no-interaction

#php app/console doctrine:fixtures:load --no-interaction

chown -R www-data:www-data .

php5-fpm -F
