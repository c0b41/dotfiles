function goversion
{
	go version | awk '{ print substr( $0, 14 ,6) }'
}