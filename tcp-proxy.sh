#!/usr/bin/env bash

HOST="${TARGET_HOST:-${1}}"
PORT="${TARGET_PORT:-${2}}"
LISTEN_PORT=${LISTEN_PORT:-${PORT}}

if [ -n ${HOST} ] && [ -n ${PORT} ] && [ -n ${LISTEN_PORT} ]; then
    echo "Missing environment variables or command line options: $(basename $0) host port"
    exit 1
fi

echo "relay TCP/IP connections on :${LISTEN_PORT} to ${HOST}:${PORT}"
exec socat TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr TCP:${HOST}:${PORT}
