#!/bin/bash

# Usage:
#  sudo ./popcorntime-build.sh
#    or for next-nightly:
#  sudo ./popcorntime-build.sh next

nightly="https://ci.popcorntime.io/job/Popcorn-Time/"
if [ "X$1" == "Xnext" ]; then
  nightly="https://ci.popcorntime.io/job/Popcorn-Experimental/"
fi



latest=$(curl -s ${nightly} | cheerio '.fileList tr:eq(3)td:eq(1)a' -a href)

url=$nightly$latest

echo "Downloading ${url}..."

curl -sL $url | xzcat | tar -vx --strip-components=1 -C /opt/popcorn-time &> /dev/null 