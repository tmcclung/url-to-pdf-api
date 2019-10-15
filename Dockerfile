ARG CHROMIUM_VERSION=63.0.3205.0
FROM microbox/chromium-headless:$CHROMIUM_VERSION
ARG CHROMIUM_VERSION=63.0.3205.0
ARG NODE_VERSION=8.9.0
MAINTAINER Ling <x@e2.to>

RUN echo ${NODE_VERSION}

RUN apt-get update -y && apt-get install -yq fontconfig fonts-dejavu nodejs && rm -rf /var/lib/apt/lists/*
RUN which node

COPY  .                              /root

ENV CHROMIUM_VERSION=$CHROMIUM_VERSION \
    NODE_VERSION=$NODE_VERSION \
    NODE_ENV=development \
    PORT=9000 \
    ALLOW_HTTP=true \
    PUPPETEER_CHROMIUM_PATH=/bin/chromium

EXPOSE 9000

ENTRYPOINT ["/usr/bin/node", "src/index.js"]
