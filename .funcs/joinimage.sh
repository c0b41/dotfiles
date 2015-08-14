function joinimage
{
   command montage -mode concatenate -tile 1x $@
}

function joinimage2
{
   command montage -mode concatenate -tile 2x $@
}