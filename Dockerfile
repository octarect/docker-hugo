FROM golang:1.9.7-alpine3.7
MAINTAINER ryota.kota@member.fsf.org

ENV HUGO_BASE_URL http://localhost
ENV HUGO_APP_ROOT .

RUN set -x && \
    apk add --update hugo

WORKDIR /go/src/app
COPY $HUGO_APP_ROOT .

EXPOSE 80
ENTRYPOINT /usr/bin/hugo server -D --baseURL $HUGO_BASE_URL --port 80 --bind 0.0.0.0
