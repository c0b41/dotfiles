# SYNOPSIS
#   recordtv [options]
#
# USAGE
#   Options
#

function recordtv -d "Recordtv function"
  if not available ffmpeg
    echo "📂  Please install ffmpeg first!"
  else
    set brodcastinfo (curl --insecure -s $Brodcast_Url | jq -r '.Url')
    set brodcast (echo $brodcastinfo | cut -d '?' -f2)
    set url "$Recordt_Url$brodcast"
    set filename (eval date '+%Y-%b-%d')
    set rnumb  (eval random )
    ffmpeg -i $url -c copy -t $argv[2] $filename-$rnumb.$argv[1]
  end
end
