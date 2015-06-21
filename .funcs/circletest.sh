function circletest
{
data="$(cat <<-EOF
 machine:
   pre:
     - curl https://raw.githubusercontent.com/creationix/nvm/v0.23.3/install.sh | bash
   node:
     version: iojs-2.3.0
 dependencies:
   override:
     - npm install
 test:
   post:
     - npm test
EOF
)" 
 command echo "$data" > circle.yml 
 command git add circle.yml
 command git commit -m "circle ci test added"
 #command git u
 echo -e "${blue} Circle ci dosyası oluşturuldu ve gönderildi :)  ${reset}"
}
