function compile
{
  filename="$1.c"
  exe="$1.exe"
  command gcc $filename -o $1 && $exe 
}