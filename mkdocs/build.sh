#!/usr/bin/env bash

set -euo pipefail

ver=0.0.1

docker build -t davetang/mkdocs:${ver} .

# docker login
# docker push davetang/mkdocs:${ver}

