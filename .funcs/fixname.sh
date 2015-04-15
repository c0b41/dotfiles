function fixname
{ 
  variable="$1"
  name="$(echo ${variable##*/} | torrent-name | jq -r '.title' | sed -e "s/\b\(.\)/\u\1/g")"
  season="$(echo ${variable##*/} | torrent-name | jq -r '.season')"
  episode="$(echo ${variable##*/} | torrent-name | jq -r '.episode')"
  newname="$(echo ${name} | sed 's/ /_/g')"
  new="${newname}_S0${season}_E0${episode}"
  echo $new
}


