function javacompile
{
   arr=( $(find . -type f -name "*.java") )

   for I in ${!arr[*]}; do
	command javac ${arr[$I]}
   done

  echo -e "${blue}  Java Compile edildi  ${reset}"

  command java $1
}