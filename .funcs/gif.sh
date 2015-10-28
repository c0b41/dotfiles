## @usage gif example.mov
function gif {
 if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize $3x$4 \> out-static*.png  GIF:- | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s $2x$3 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}