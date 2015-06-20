function compile
{
  filename="$1.c"
  exe="$1.exe"
  echo -e "${blue}  C kodu compile edildi  ${reset}"
  command gcc $filename -o $1 && $exe 
}