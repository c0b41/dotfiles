# SYNOPSIS
#   say [options]
#
# USAGE
#   Options
#

function say
  if not available mpg123
    echo "📂  Please install mpg123 first!"
  else
    iconv -f Windows-1254 -t UTF-8 $argv[1] > $argv[2]
    set p eval(echo $argv | sed 's/ /+/g');
	  set URL "http://translate.google.com/translate_tts?tl=tr&q=$p";
	  wget -U Mozilla -q  -O - "$@" "$URL" | mpg123 - &> /dev/null
  end
end
