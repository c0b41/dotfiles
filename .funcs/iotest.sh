function iotest
{
data="$(cat <<-EOF
	language: node_js
	node_js:
	  - iojs-v1.6.0
	EOF
	)" 
 datas="$(cat package.json | jq '.scripts.test="iojs node_modules/mocha/bin/mocha test.js --reporter spec --timeout 15000"')"
 command echo "$data" > .travis.yml 
 command echo "$datas" > package.json
 echo -e "${blue} Travis ci dosyası oluşturuldu :)  ${reset}"
}