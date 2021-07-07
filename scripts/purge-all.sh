#!/bin/bash

cd "$(dirname "$0")"
cd ..

docker system prune -a -f --volumes
sudo rm -f -r vols
