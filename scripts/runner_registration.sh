#!/bin/bash

cd "$(dirname "$0")"
cd ..

. .env

docker-compose exec gitlab-runner gitlab-runner register --non-interactive