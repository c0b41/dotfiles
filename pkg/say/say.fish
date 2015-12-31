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
    set p (echo $argv | sed 's/ /+/g');
	  set URL "http://translate.google.com/translate_tts?tl=tr&q=$p";
	  curl -A "Mozilla" "$URL" | mpg123 - >> /dev/null
  end
end
