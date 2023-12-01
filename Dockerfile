FROM alpine:3.18.5

# hadolint ignore=DL3018
RUN apk add --no-cache bash socat

COPY tcp-proxy.sh /usr/bin/tcp-proxy

ENTRYPOINT ["tcp-proxy"]
