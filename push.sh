#!/bin/bash

msg=$1
if [ -z "$msg" ]
then
    read -p "the commit message: " msg;
fi
git add .;
git commit -m "$msg";
git push;