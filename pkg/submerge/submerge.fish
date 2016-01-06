# SYNOPSIS
#   submerge [options]
#
# USAGE
#   Options
#   Src videofile
#   srt subtitlefile
#   ouput video
#   submerge mr.robot.1x01.mkv sub.srt output.mkv

function submerge
  if not available mencoder
    echo "📂  Please install mencoder first!"
  else
    mencoder $argv[1] -sub $argv[2] -subcp utf8 -subfont-text-scale 3 -subfont-outline 1 -ovc xvid -oac mp3lame -xvidencopts pass=1 -o $argv[3]
  end
end
