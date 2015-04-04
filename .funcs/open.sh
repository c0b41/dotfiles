function open2
{
  command start $PWD/$1 && cd $1
}


function open
{
  command xdg-open $1 > /dev/null && cd $1;
}
