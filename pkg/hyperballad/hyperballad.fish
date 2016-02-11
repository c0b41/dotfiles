# SYNOPSIS
#   hyperballad [options]
#
# USAGE
#   Options
#
function hyperballad -d "Recordtv timeout function"
  set filename (eval date '+%Y-%b-%d')
  set rnumb  (eval random )
  timeout $Recordtv_Timeout ffmpeg -i $Recordtv_Url -c copy $filename-$rnumb.$argv[1]
end
