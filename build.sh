set -x

rm -rf symfony
git clone https://github.com/drmjo/toto.git symfony

export SECRET=`cat /dev/urandom | base64 | head -c 40`

sed -i '.original' -e "s|{{secret}}|${SECRET}|g" symfony/app/config/parameters.yml.dist

docker-compose build
