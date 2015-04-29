#!/bin/bash

# Usage:
#  sudo ./install-iojs-nightly.sh
#    or for next-nightly:
#  sudo ./install-iojs-nightly.sh next

type=release
if [ "X$1" == "Xnext" ]; then
  type=next-nightly
fi

latest=$(curl -sL https://iojs.org/download/${type}/index.tab | head -2 | tail -1 | awk '{ print $1 }')
url="https://iojs.org/download/${type}/$latest/iojs-${latest}-linux-x64.tar.xz"

echo "Downloading ${url}..."

curl -sL $url | xzcat | tar -vx --strip-components=1 -C /usr/local/
