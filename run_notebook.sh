#!/usr/bin/env bash
set -e

DOCKER_IMAGE=$(docker build . -q)

docker run -it \
  -p 127.0.0.1:8888:8888 \
  -w /jupyter \
  -u "$(id -u):$(id -g)" \
  -v "$HOME/.local/share/jupyter:/.local/share/jupyter" \
  -v "$(pwd)/jupyter:/jupyter" \
  "$DOCKER_IMAGE"