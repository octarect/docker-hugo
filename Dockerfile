FROM golang:1.9.7-alpine3.7
MAINTAINER ryota.kota@member.fsf.org

WORKDIR /go/src/app
COPY . .

RUN set -x && \
    apk add --update hugo

EXPOSE 80
ENTRYPOINT ["/usr/bin/hugo", "server", "--port=80", "--bind=0.0.0.0"]
