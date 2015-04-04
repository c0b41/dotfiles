function youtubelist
{
while read line
do
  command youtube-dl $line -x -o "%(title)s.%(ext)s" --audio-format=mp3 --audio-quality=512k
done < $1

}
