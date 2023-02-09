#!/bin/bash

msg=$1
if [ -z "$msg" ]
then
    read -p "the commit message: " msg;
fi
git add .;
echo $msg
git commit -m "$msg";
git push;