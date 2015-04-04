function iop
 {
  if [ -z "$1" ]; then
    echo -e "${red}   İsim yok pnp :(  ${reset}"
  else
    command mkdir $1 && cd $1
    command ign create 
    command ign apply
    command npm init
    badge $nickname $1 > readme.md
    echo -e "${blue}   Readme.md oluşturuldu :)  ${reset}"
    iotest
    echo -e "${blue}   Hepsini Oluşturduk pnp :)  ${reset}"
  fi  
 }