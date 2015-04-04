function youtube
{
command youtube-dl $1 -x -o "%(title)s.%(ext)s" --audio-format=mp3 --audio-quality=512k
}