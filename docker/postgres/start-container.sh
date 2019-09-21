#! /bin/bash

set -e

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
            echo "Usage: $0 [options]" >&2
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

if ! test -f docker/postgres/.latest; then
    echo "Doesn't seem like you have compiled the image. Building it now." >&2
    ./docker/postgres/build-image.sh
fi

image=$(cat ./docker/postgres/.latest)
name="postgres"

if ! test -d volumes/postgres; then
    mkdir -p volumes/postgres
fi

echo "Starting $name container from image $image." >&2

docker run \
    --name $name \
    --hostname postgres \
    $extra_options \
    --volume $(pwd)/volumes/postgres:/var/lib/postgresql/data \
    --publish 5432:5432 \
    $image


