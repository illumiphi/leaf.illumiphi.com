#!/usr/bin/env bash

wget \
     --recursive \
     --page-requisites \
     --html-extension \
     --convert-links \
     --span-hosts \
     --restrict-file-names=windows \
     https://$1

     # --domains $1  \
