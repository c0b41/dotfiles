function iotest
{
data="$(cat <<-EOF
	language: node_js
	node_js:
	  - iojs-v2.3.0
	EOF
	)" 
 #datas="$(cat package.json | jq '.scripts.test="mocha --harmony ./test/test.js --reporter spec --timeout 15000 --require mocha-clean"')"
 command echo "$data" > .travis.yml 
 #command echo "$datas" > package.json
 echo -e "${blue} Travis ci dosyası oluşturuldu :)  ${reset}"
}