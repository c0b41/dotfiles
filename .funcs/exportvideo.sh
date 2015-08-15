# @usage exportvideo MrRobot1x08.mkv subtitle.srt
function exportvideo
{
   command cp $1 bolum.mkv
   command sconvert $2 rev_$2.srt
   command mencoder bolum.mkv -sub rev_$2.srt -subcp utf8 -subfont-text-scale 3 -subfont-outline 1 -ovc xvid -oac mp3lame -xvidencopts pass=1 -o output-bolum.avi 
}