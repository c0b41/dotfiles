function say(){
	
	p=$(echo $* |sed 's/ /+/g');
	URL="http://translate.google.com/translate_tts?tl=$gt_lang&q=$p"; 
	wget -U Mozilla -q  -O - "$@" "$URL" |mpg123 - &> /dev/null  

}