#!/bin/bash

cd "$(dirname "$0")"
cd ..

. .env

docker-compose exec gitlab-runner \
    gitlab-runner register --non-interactive \
        -r ${GITLAB_RUNNER_TOKEN} \
        -u 'http://gitlab' \
        --clone-url 'http://gitlab' \
        --run-untagged 'true' \
        --locked 'false' \
        --access-level 'not_protected'