# SYNOPSIS
#   hyperballad [options]
#
# USAGE
#   Options
#
function hyperballad -d "Recordtv timeout function"
  set brodcastinfo (curl --insecure -s $Brodcast_Url | jq -r '.Url')
  set brodcast (echo $brodcastinfo | cut -d '?' -f2)
  set url "$Recordt_Url$brodcast"
  set filename (eval date '+%Y-%b-%d')
  set rnumb  (eval random )
  timeout $Recordtv_Timeout ffmpeg -i $url -c copy $filename-$rnumb.$argv[1]
end
