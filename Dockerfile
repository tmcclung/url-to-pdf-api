ARG CHROMIUM_VERSION=63.0.3205.0
FROM microbox/chromium-headless:$CHROMIUM_VERSION
ARG CHROMIUM_VERSION=63.0.3205.0
MAINTAINER Ling <x@e2.to>

RUN echo "I see you david 1" > iseeyou.txt

RUN apt-get update -y && apt-get install -yq fontconfig fonts-dejavu nodejs npm && rm -rf /var/lib/apt/lists/* && npm install express
RUN which node

COPY  .                              /root

ENV CHROMIUM_VERSION=$CHROMIUM_VERSION \
    NODE_ENV=development \
    PORT=9000 \
    ALLOW_HTTP=true \
    PUPPETEER_CHROMIUM_PATH=/bin/chromium

EXPOSE 9000

ENTRYPOINT ["/usr/bin/node", "src/index.js"]
