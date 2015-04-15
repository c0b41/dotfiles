function mp3name
{
find $HOME/Müzik -type f -name '*.mp3' | while read i; do
	name="$(echo $i | ytclear )"
   echo $name
done
}
