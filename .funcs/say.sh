function say(){

	p=$(echo $1 |sed 's/ /%20/g');
	wget -U Mozilla -q -O - "$@" translate.google.com/translate_tts?tl=tr\&q=$p|mpg123 -  

}