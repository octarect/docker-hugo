FROM golang:1.9.7-alpine3.7
MAINTAINER ryota.kota@member.fsf.org

WORKDIR /go/src/app
COPY . .

RUN set -x && \
    apk add --update git && \
    go get github.com/magefile/mage && \
    go get -d github.com/gohugoio/hugo && \
    cd ${GOPATH:-$HOME/go}/src/github.com/gohugoio/hugo && \
    mage vendor && \
    mage install

EXPOSE 8000
ENTRYPOINT ["hugo", "server", "--port=8000", "--bind=0.0.0.0"]
