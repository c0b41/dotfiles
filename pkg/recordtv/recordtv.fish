# SYNOPSIS
#   recordtv [options]
#
# USAGE
#   Options
#

function recordtv
  if not available ffmpeg
    echo "📂  Please install ffmpeg first!"
  else
    set filename (eval date '+%Y-%b-%d')
  	ffmpeg -i $Recordtv_Url -c copy $filename.$argv[1]
  end
end
