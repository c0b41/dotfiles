# SYNOPSIS
#   videocut [options]
#
# USAGE
#   Options
#   Src videofile
#   Start time
#   Cut Time

function videocut
  if not available ffmpeg
    echo "📂  Please install 'apt-get install ffmpeg ' first!"
  else    
  	set rnumb  (eval random )
  	ffmpeg -i $argv[1] -ss $argv[2] -t $argv[3] -async 1 -strict -2 cut_$rnumb.mp4  > /dev/null 2>&1
  end
end