#!/bin/bash

# Usage:
#  sudo ./popcorntime-build.sh


nightly="https://ci.popcorntime.io/job/Popcorn-Experimental/"

latest=$(curl -s https://ci.popcorntime.io/job/Popcorn-Experimental/ | cheerio '.fileList tr:eq(3)td:eq(1)a' -a href)

url=$nightly$latest

echo "Downloading ${url}..."

curl -sL $url | xzcat | tar -vx --strip-components=1 -C /opt/popcorn-time &> /dev/null 