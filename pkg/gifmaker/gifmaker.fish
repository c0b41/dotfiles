# SYNOPSIS
#   gifmaker [options]
#
# USAGE
#   Options
#   Src videofile
#   width size
#   height size

function gifmaker
  if not available ffmpeg imagemagick gifsicle
    echo "📂  Please install ffmpeg,imagemagick,gifsicle first!"
  else

  	if [ $argv[1] ]

	    set outfilename (eval basename $argv[1] | cut -d. -f1)
  		set filename "$outfilename.gif"


		  if [ $argv[2] ]
		   set maxsize "-vf scale=$2:-1"
		  else
		   set maxsize ""
		  end

  		  echo "Creating $filename..."

  		  eval  ffmpeg -loglevel panic -i  $argv[1] $maxsize -r 10 -vcodec png gifify-tmp-%05d.png
		  convert +dither -layers Optimize gifify-tmp-*.png GIF:- | gifsicle --no-warnings --colors 256 --delay=10 --loop --optimize=3 --multifile - > $filename
		  rm gifify-tmp-*.png

	else
	    echo " Example: gifmaker test.mov 700 400 "
	end

  end
end
