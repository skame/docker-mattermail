FROM golang:1.7-alpine

MAINTAINER Satoshi KAMEI "ml+github@kamei.nu"

RUN apk --update add curl wget git
RUN curl -s -L https://github.com/rodrigocorsi2/mattermail/releases | \
    egrep -o '/rodrigocorsi2/mattermail/releases/download/[0-9.]*/mattermail-.*linux.am64.tar.gz' | head -1 | \
    wget --base=http://github.com/ -i - -O /tmp/mattermail.tar.gz && \
    tar xvfz /tmp/mattermail.tar.gz -C /tmp

RUN go get github.com/rodrigocorsi2/mattermail | true
RUN go get github.com/rodrigocorsi2/mattermail

CMD /go/bin/mattermail -c /config.json

