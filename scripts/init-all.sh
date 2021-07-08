#!/bin/bash

cd "$(dirname "$0")"
cd ..

. .env

set -x #echo on

docker network create ${GITLAB_NETWORK}

mkdir ./vols/gitlab/config -p
mkdir ./vols/gitlab/data -p
mkdir ./vols/gitlab/logs -p
# mkdir ./vols/postgresql -p
# mkdir ./vols/postgresql/data -p
mkdir ./vols/sonarqube/data -p
mkdir ./vols/sonarqube/extensions -p
mkdir ./vols/sonarqube/logs -p
mkdir ./vols/sonarqube/temp -p
mkdir ./vols/gitlab-runner/config -p
touch -a ./vols/gitlab-runner/config/config.toml

docker-compose up --build -d
