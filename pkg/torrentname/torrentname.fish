# SYNOPSIS
#   torrentname [name]
#
# USAGE
#   name
#

function torrentname
  if not available torrent-name jq
    echo "📂  Please install 'npm install -g torrrent-name && jq ' first!"
  else    
  	set data  (eval torrent-name $argv)
  	set title (echo $data | jq -r '.title' | sed -e "s/\b\(.\)/\u\1/g" )
  	set season (echo $data | jq -r '.season' )
  	set episode (echo $data | jq -r '.episode' )
  	set new "$title  S0$season x E0$episode"
  	echo $new
  end
end