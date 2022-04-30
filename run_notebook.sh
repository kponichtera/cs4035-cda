#!/usr/bin/env bash
set -e

DOCKER_IMAGE=cs4035

docker build -t $DOCKER_IMAGE .

docker run -it \
  -p 127.0.0.1:8888:8888 \
  -w /jupyter \
  -u "$(id -u):$(id -g)" \
  -v "$HOME/.local/share/jupyter:/.local/share/jupyter" \
  -v "$HOME/.config/matplotlib:/.config/matplotlib" \
  -v "$HOME/.cache/matplotlib:/.cache/matplotlib" \
  -v "$HOME/.jupyter:/.jupyter" \
  -v "$(pwd)/jupyter:/jupyter" \
  $DOCKER_IMAGE