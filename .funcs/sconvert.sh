function sconvert
{ 
  command iconv -f Windows-1254 -t UTF-8 $1 > $2
}