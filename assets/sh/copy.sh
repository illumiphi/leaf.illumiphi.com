#!/usr/bin/env bash

rm -rf pages
cp -r otbc.org/ pages
cd pages
rm $(find .  -maxdepth 1 -type f -name "*.html" ! -name "index.html")
rm -rf $(find .  -type d -name "feed" ! -name "index.html")
rm robots.txt
rm xml*
rm -rf wp-{includes,json} comments feed

for file in $(find  -name "*.html")
do
  ../sh/parse.sh $file

done
