## @usage gif example.mov
function gif {
  if [ -z "$1" ]; then
    echo "No input file given. Example: gif example.mov [max width (pixels)]"
    return 1
  fi

  output_file="${1%.*}.gif"

  echo "Creating $output_file..."

  if [ ! -z "$2" ]; then
    maxsize="-vf scale=$2:-1"
  else
    maxsize=""
  fi

   ffmpeg -loglevel panic -i $1 $maxsize -r 10 -vcodec png gifify-tmp-%05d.png
  convert +dither -layers Optimize gifify-tmp-*.png GIF:- | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile - > $output_file
  rm gifify-tmp-*.png

  echo "Done."
}