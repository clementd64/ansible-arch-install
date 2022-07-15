#!/bin/sh

DOCKER_IMAGE="ansible-arch-install"

if ! docker image inspect "$DOCKER_IMAGE" >/dev/null; then
    docker build -t "$DOCKER_IMAGE" - <<EOF
FROM python:3.10-alpine
RUN apk add --no-cache openssh-client && pip install ansible
EOF
fi

docker run --rm -it \
    -v $(readlink -f $SSH_AUTH_SOCK):/ssh-agent \
    -e SSH_AUTH_SOCK=/ssh-agent \
    -v "$PWD":/app -w /app \
    "$DOCKER_IMAGE" \
    ansible-playbook -i inventory.yml install.yml $@