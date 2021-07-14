#!/bin/bash

cd "$(dirname "$0")"
cd ..

. .env

set -x #echo on

sudo sysctl -w vm.max_map_count=262144
#sudo sysctl -w fs.file-max=65536
#sudo ulimit -n 65536
#sudo ulimit -u 4096

docker network create ${GITLAB_NETWORK}

mkdir ./vols/gitlab/config -p
mkdir ./vols/gitlab/data -p
mkdir ./vols/gitlab/logs -p

mkdir ./vols/postgresql/data -p

mkdir ./vols/sonarqube/data -p
mkdir ./vols/sonarqube/extensions -p

mkdir ./vols/gitlab-runner/config -p
touch -a ./vols/gitlab-runner/config/config.toml

docker-compose --profile sonarqube up --build -d --remove-orphans
