function blur
{
  convert ./"$1" -resize 1137 -extent 1137x640 -blur 0x4 ./"new-$1"
}
