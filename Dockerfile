FROM alpine:edge
MAINTAINER ryota.kota@member.fsf.org

ARG HUGO_APP_ROOT=.
ENV HUGO_BASE_URL http://localhost
ENV HUGO_PORT 1313

RUN set -x && \
    apk add --update hugo

WORKDIR /app
COPY $HUGO_APP_ROOT .

EXPOSE $HUGO_PORT
ENTRYPOINT /usr/bin/hugo server --baseURL $HUGO_BASE_URL --bind 0.0.0.0 --port $HUGO_PORT --renderToDisk public --appendPort=false
