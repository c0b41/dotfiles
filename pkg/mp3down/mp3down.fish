# SYNOPSIS
#   mp3down [options]
#
# USAGE
#   Options
#

function mp3down
  if not available youtube-dl
  echo "📂  Please install youtube-dl first!"
  else
    if count $argv > /dev/null
      youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $argv[1]
    else
      echo " example usage [ mp3down EgqUJOudrcM ] "
    end
  end
end
