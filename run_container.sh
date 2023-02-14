#!/bin/bash

# yes | docker system prune -a
docker build -t alpine-test -f nginx.Dockerfile .
docker run -it --rm --name alpine_container -p 80:80 alpine-test