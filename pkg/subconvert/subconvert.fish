# SYNOPSIS
#   subconvert [options]
#
# USAGE
#   Options
#   srt original subtitle
#   newsrt new subtitle
#

function subconvert
  if not available iconv
    echo "📂  Please install iconv first!"
  else
    iconv -f Windows-1254 -t UTF-8 $argv[1] > $argv[2]
  end
end
