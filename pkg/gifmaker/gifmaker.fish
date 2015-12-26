# SYNOPSIS
#   gifmaker [options]
#
# USAGE
#   Options
#   Src videofile
#   width size
#   height size

function gifmaker
  if available ffmpeg convert gifsicle
    if count $argv > /dev/null

      set outfilename (eval basename $argv[1] | cut -d. -f1)
      set filename "$outfilename.gif"

      ffmpeg -i $argv[1] -vf scale=$argv[2]:-1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile - > $filename

    else
      echo " Example: gifmaker test.mov 700 "
    end
  else
    echo "💝  Please install 'ffmpeg,imagemagick,gifsicle' first!"
  end
end
