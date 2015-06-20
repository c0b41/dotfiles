function torrentlist
{
find . -type f -name '*.torrent' | while read i; do
   command torrent $i
done
sudo shutdown -h +5
}
