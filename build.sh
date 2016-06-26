#!/usr/bin/env bash

while test $# -gt 0; do
    case "$1" in
        --rebuild-source)
            REBUILD=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

if [ "$REBUILD" = true ] ; then
    rm -rf symfony
    git clone https://github.com/drmjo/toto.git symfony
    export SECRET=`cat /dev/urandom | base64 | head -c 40`
    sed -i ".original" -e "s|{{secret}}|${SECRET}|g" symfony/app/config/parameters.yml.dist
fi

docker-compose build
