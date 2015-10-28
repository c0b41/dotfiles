# usage cutvideo out-mrrobot.avi 23:33 02:20
function cutvideo
{
  ffmpeg -i $1 -ss 00:$2 -t 00:$3 -async 1 -strict -2 cut_$RANDOM.mp4
}