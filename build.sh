#!/bin/bash
if [[ $1 == "dev" ]]; then
  echo "Build DEV image"
  docker build -t hfrd/minifabdash:latest . --build-arg DEVMODE=TRUE
else
  echo "Build PRODUCTION image"
  docker build -t hfrd/minifabdash:latest .
fi
docker rmi -f $(docker images -q -f "dangling=true")
