#!/bin/bash

cd "$(dirname "$0")"
cd ..

. local-run.env

docker-compose run -d --name 'local-runner' -v ${HOST_SOURCE_DIR}:${HOST_SOURCE_DIR} gitlab-runner \

docker exec -i -t -w $HOST_SOURCE_DIR local-runner \
    gitlab-runner exec docker $JOB_NAME \
        --env SONAR_HOST_URL=$SONAR_HOST_URL \
        --env SONAR_TOKEN=$SONAR_TOKEN \
        --env CI_PROJECT_NAME=$(basename $HOST_SOURCE_DIR)

docker rm -f local-runner