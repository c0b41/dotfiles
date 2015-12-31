# SYNOPSIS
#   parlaklık [options]
#
# USAGE
#   Options
#   number
#   parlaklık 5

function parlaklık
  if not available brightness
    echo "📂  Please install 'npm install -g brightness-cli' first!"
  else
    set numb "0.$argv[1]"
    brightness $numb
  end
end
