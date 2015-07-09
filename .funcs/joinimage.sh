function joinimage
{
   command montage -mode concatenate -tile 1x $@
}