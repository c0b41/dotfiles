function mp3name
{
IFS='
'
find . -type f -name '*.mp3' | while read i; do
	name="$(echo $i | ytclear )"
    mv $i $name 2>/dev/null
done
}
