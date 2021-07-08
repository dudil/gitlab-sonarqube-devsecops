#!/bin/bash

cd "$(dirname "$0")"
cd ..

. .env

docker-compose exec gitlab-runner gitlab-runner register --non-interactive \
                                                         --url "http://gitlab" \
                                                         --registration-token "${GITLAB_RUNNER_TOKEN}" \
                                                         --name "default-local" \
                                                         --executor "docker" \
                                                         --docker-image ubuntu:latest \
                                                         --locked="false"  \
                                                         --run-untagged="true" \
                                                         --access-level="not_protected" \
                                                         --clone-url="http://gitlab" \
                                                         --docker-volumes="/var/run/docker.sock:/var/run/docker.sock" \
                                                         --docker-network-mode="${GITLAB_NETWORK}"