function convertlist
{

oIFS=$IFS
IFS=$'\n'
  
find . -name '*.mp3' | while read -r i; do
  filename="${i%.*}"
  newname=($(echo $filename | ytclear))
  mv $i "${newname}.mp3"

done

IFS=$oIFS

}
