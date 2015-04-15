function trename
{
  variable="$1"
  newname="$(fixname ${variable})" 
  rename $1 $newname
}