#!/bin/bash
if [[ $1 == "dev" ]]; then
  docker run -dit --name node --entrypoint npm \
  -p 3000:3000 -p 3001:3001 \
  -v $(pwd)/ui/public:/home/node/ui/public \
  -v $(pwd)/ui/src:/home/node/ui/src \
  -v $(pwd)/ui/app.js/home/node/ui/app.js \
  -v $(pwd)/ui/package.json:/home/node/ui/package.json \
  -v $(pwd)/package.json:/home/node/package.json \
  -v $(pwd)/server.js:/home/node/server.js \
  hfrd/minifabdash:latest run startdev
else
  docker run -dit --name node --rm --entrypoint npm \
  -p 3001:3001 hfrd/minifabdash:latest run startapi
fi