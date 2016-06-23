set -x

export SYMFONY__SESSION__SECRET=`cat /dev/urandom | base64 | head -c 40`

docker-compose up &
