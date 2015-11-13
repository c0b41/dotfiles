# SYNOPSIS
#   gitremote [options]
#
# USAGE
#   Options
#   http {name}
#   ssh {name}
#

function gitremote
  if not available git
  echo "📂  Please install 'sudo apt-get install git' first!"
  else
    set name (git config github.user)
    switch $argv[1]
      case http
        git remote set-url origin git@github.com:$name/$argv[2].git
      case ssh
        git remote set-url origin https://github.com/$name/$argv[2].git
    end
  end
end
