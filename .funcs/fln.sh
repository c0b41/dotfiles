## @usage fln ext {html,js} > list.json

function fln
{
   arr=( $(find . -type f -name "*.$1") )
    chunk="{list:{["
   for I in ${!arr[*]}; do

        if [ $((${#arr[*]} -1)) == $I ]; then
              chunk+="'${arr[$I]}'"
        else          
              chunk+="'${arr[$I]}'," 
        fi
  done
  chunk+="]}"

  echo ${chunk}
}