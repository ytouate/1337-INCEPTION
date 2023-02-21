#!/bin/bash

# yes | docker system prune -a
docker build -t alpine-test -f nginx.Dockerfile .
docker run -it --rm --name alpine_container -p 443:443 -p 5000:5000 alpine-test