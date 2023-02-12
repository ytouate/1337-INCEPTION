#!/bin/bash
# to run docker without sudo
sudo setfacl -m user:$USER:rw /var/run/docker.sock