# SYNOPSIS
#   worktime [options]
#
# USAGE
#   Options
#

function worktime
  if not available dev-time
  echo "📂  Please install 'npm install --global dev-time-cli' "
  else
    if count $argv > /dev/null
      dev-time $argv[1]
    else
      dev-time $nickname
    end
  end
end
