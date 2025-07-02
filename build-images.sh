#!/usr/bin/env bash
# Do not edit by hand; please use build scripts/templates to make changes
set -eo pipefail

docker context create darklakefi
docker buildx create --use darklakefi
docker buildx build --platform=linux/amd64,linux/arm64 --file 1.88/Dockerfile -t darklakefi/circleci-rust:1.88.0 -t darklakefi/circleci-rust:1.88 --push .
docker buildx build --platform=linux/amd64,linux/arm64 --file 1.88/node/Dockerfile -t darklakefi/circleci-rust:1.88.0-node -t darklakefi/circleci-rust:1.88-node --push .
docker buildx build --platform=linux/amd64 --file 1.88/browsers/Dockerfile -t darklakefi/circleci-rust:1.88.0-browsers -t darklakefi/circleci-rust:1.88-browsers --push .
