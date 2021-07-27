#!/bin/bash

cd "$(dirname "$0")"
cd ..

. local-run.env

CONTAINER_NAME='local-runner'

if [ ! "$(docker ps -a | grep <${CONTAINER_NAME}>)" ]; then
    docker-compose run -d --name ${CONTAINER_NAME} -v ${HOST_SOURCE_DIR}:${HOST_SOURCE_DIR} gitlab-runner
fi

docker exec -i -t -w $HOST_SOURCE_DIR local-runner \
    gitlab-runner exec docker $JOB_NAME \
        --env SONAR_HOST_URL=$SONAR_HOST_URL \
        --env SONAR_TOKEN=$SONAR_TOKEN \
        --env CI_PROJECT_NAME=$(basename $HOST_SOURCE_DIR)


remove_container() {
    docker rm -f local-runner
}

while getopts ":rm" opt; do
  case ${opt} in
    rm )
      remove_container
      ;;
    \? )
      echo "Invalid option: $OPTARG" 1>&2
      ;;
    : )
      echo "Invalid option: $OPTARG requires an argument" 1>&2
      ;;
  esac
done
shift $((OPTIND -1))