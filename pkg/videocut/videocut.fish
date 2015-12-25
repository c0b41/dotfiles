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
    ffmpeg -i $argv[1] -vcodec copy -acodec copy -ss $argv[2] -to $argv[3] -strict -2 cut_$rnumb.$argv[4]  > /dev/null 2>&1
    notify-send "video kırpma işlemi bitti"
  end
end
