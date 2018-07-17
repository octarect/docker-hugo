FROM golang:1.9.7-alpine3.7
MAINTAINER ryota.kota@member.fsf.org

ARG HUGO_APP_ROOT=.
ENV HUGO_BASE_URL http://localhost
ENV HUGO_PORT 1313

RUN set -x && \
    apk add --update hugo

WORKDIR /go/src/app
COPY $HUGO_APP_ROOT .

EXPOSE 80
ENTRYPOINT /usr/bin/hugo server -D --baseURL $HUGO_BASE_URL --bind 0.0.0.0 -p $HUGO_PORT
