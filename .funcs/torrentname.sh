function tname
{
for file in $HOME/İndirilenler/*.torrent; do
  name="$(echo ${file##*/} | torrent-name | jq -r '.title' | sed -e "s/\b\(.\)/\u\1/g")"
  season="$(echo ${file##*/} | torrent-name | jq -r '.season')"
  episode="$(echo ${file##*/} | torrent-name | jq -r '.episode')"
  echo "$name S0${season}E0${episode}" 
done
}


