# SYNOPSIS
#   exportvideo [options]
#
# USAGE
#   Options
#   Src videofile
#	  Src subtitlefile

function exportvideo
  if not available mencoder
    echo "📂  Please install 'apt-get install mencoder' first!"
  else
  	cp $argv[1] bolum.mkv
  	iconv -f Windows-1254 -t UTF-8 $argv[2] > sub_convert.srt
  	mencoder bolum.mkv -sub sub_convert.srt -subcp utf8 -subfont-text-scale 3 -subfont-outline 1 -ovc xvid -oac mp3lame -xvidencopts pass=1 -o output-bolum.avi
  end
end
