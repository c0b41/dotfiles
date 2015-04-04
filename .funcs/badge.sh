function badge
{
template="$(cat <<-EOF
[![Travis Build Status](http://img.shields.io/travis/{{name}}/{{proje}}.svg?style=flat-square)](https://travis-ci.org/{{name}}/{{proje}}) [![Circle Build Status](https://img.shields.io/circleci/project/{{name}}/{{proje}}.svg?style=flat-square)](https://circleci.com/gh/{{name}}/{{proje}}) [![Appveyor Build Status](https://img.shields.io/appveyor/ci/{{name}}/{{proje}}.svg?style=flat-square)](https://ci.appveyor.com/project/{{name}}/{{proje}}) [![Build Status](https://img.shields.io/david/{{name}}/{{proje}}.svg?style=flat-square)](https://david-dm.org/{{name}}/{{proje}}) [![io.js supported](https://img.shields.io/badge/io.js-supported-green.svg?style=flat-square)](https://iojs.org)
EOF
  )"

echo $template | name=$1 proje=$2 mush 
}
