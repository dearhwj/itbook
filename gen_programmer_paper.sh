
if [ ! -d  $1 ]; then
	echo  "$1 directory not exist	"
	exit 1;
fi

if [ -f  $2 ]; then
	rm -rf $2
fi

gitbook pdf $1 $2 



