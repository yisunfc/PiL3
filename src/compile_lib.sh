if [ $# -eq 2 ]
then
	echo "compiling $1 to $2"
else
	echo "wrong param"
	echo "usage: compile.sh file target"
	exit
fi
cp $1 luasrc/
cd luasrc/
gcc -g -O0 -fPIC -shared -o $2 $1
cp $2 ../
rm $2
