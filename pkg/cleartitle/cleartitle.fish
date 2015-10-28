# SYNOPSIS
#   cleartitle [options]
#
# USAGE
#   Options
#

function cleartitle
  if not available ytclear
  echo "📂  Please install 'npm install -g ytclear' first!"
  else
    for file in *.mp3
     set newname (ytclear $file)
     mv $file $newname 2>/dev/null
    end
  end
end
