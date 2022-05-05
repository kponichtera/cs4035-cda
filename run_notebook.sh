#!/usr/bin/env bash
set -e

# Docker Compose wrapper

export CONTAINER_USER="$(id -u):$(id -g)"
export PROJECT_DIR="$(pwd)"

docker compose "$@"