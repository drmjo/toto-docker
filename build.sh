set -x

rm -rf symfony

git clone https://github.com/drmjo/toto.git symfony

docker-compose build
