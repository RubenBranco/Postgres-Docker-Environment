#! /bin/bash

set -e

extra_docker_options=""

while test $# -ge 1; do
    case $1 in
        -h|--help)
            echo "Usage: $0 [--no-cache]" >&2
            echo "" >&2
            echo "Option --no-cache will build the image without resorting to cache." >&2
            echo "" >&2
            exit 0
        ;;
        --no-cache)
            extra_docker_options+=" $1"
            shift
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

tag=$(date +'%Y%m%d-%H%M')

image=tbd-postgres

docker build \
    $extra_docker_options \
    --tag $image:$tag \
    --file docker/postgres/Dockerfile .

echo $image:$tag | tee docker/postgres/.latest