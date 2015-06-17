# Copyright 2013 Mark Lodato
# https://github.com/MarkLodato/scripts/blob/master/git-alias

function git-alias
{
	NAME=
	SORT=
	while [[ $# > 0 ]]; do
	  case "$1" in
	    -s|--sort)
	      SORT=1
	      ;;
	    *)
	      if [[ -z $NAME ]]; then
	        NAME="$1\$"
	      else
	        usage
	      fi
	  esac
	  shift
	done

	git config --get-regexp "^alias\\.$NAME" \
	  | ([[ -n $SORT ]] && sort || cat) \
	  | sed -e 's/^alias\.\(\S*\) /\1\t/'
}