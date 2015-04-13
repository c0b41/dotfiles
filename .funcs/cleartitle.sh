function cleartitle
{
   arr=( $(find . -type f -name "*.mp3") )

   for I in ${!arr[*]}; do
   	 new=($(${arr[$I]} | ytclear))
	 echo $new
   done 
}