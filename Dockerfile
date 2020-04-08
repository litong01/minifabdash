FROM node:alpine

LABEL maintainer="litong01@us.ibm.com"

USER node
ARG DEVMODE
COPY --chown=node:node . /home/node
RUN cd /home/node && npm install --no-optional && cd /home/node/ui && npm install --no-optional && npm run build && \
    if [ "$DEVMODE" != "TRUE" ]; then mv /home/node/ui/build /home/node; rm -rf /home/node/ui; fi
WORKDIR /home/node
