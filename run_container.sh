#!/bin/bash

yes | docker system prune -a
docker build -t alpine-test -f nginx.Dockerfile .
docker run -it --rm --name alpine_container alpine-test