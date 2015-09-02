function dropboxcp
{

 command rsync -rv --exclude=.git --exclude=node_modules $1 ~/Dropbox/$2
 
}