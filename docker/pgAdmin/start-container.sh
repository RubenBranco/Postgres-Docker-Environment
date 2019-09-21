#! /bin/bash

extra_options=""

while test $# -ge 1; do
    case $1 in
        --rm)
            extra_options+=" $1"
            shift
        ;;
        -d)
            extra_options+=" $1"
            shift
        ;;
        -h|--help)
            echo "Usage: $0 <USERNAME> <PASSWORD>" >&2
            echo "" >&2
            echo "Options:" >&2
            echo "  --rm            Automatically remove the container when it exits" >&2
            echo "  -d              Run container in the background, print new container id" >&2
            echo "" >&2
            exit 0
        ;;
        -*)
            echo "Unexpected option $1" >&2
            exit 2
        ;;
        *)
            break
        ;;
    esac
done

if test $# -lt 2; then
    echo "You must indicate a username and password." >&2
    exit 2
fi

if ! test -d volumes/pgadmin; then
    mkdir -p volumes/pgadmin
fi

docker run \
    --publish 8080:80 \
    -e "PGADMIN_DEFAULT_EMAIL=$1" \
    -e "PGADMIN_DEFAULT_PASSWORD=$2" \
    -e "PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION=True" \
    -e "PGADMIN_CONFIG_LOGIN_BANNER=\"Authorised users only!\"" \
    -e "PGADMIN_CONFIG_CONSOLE_LOG_LEVEL=10" \
    --link postgres \
    --name pgadmin \
    --hostname pgadmin \
    --volume $(pwd)/volumes/pgadmin:/var/lib/pgadmin \
    $extra_options \
    dpage/pgadmin4

