conda env export > environment.yml
#for h in dodo3 dodo4 dodo5 dodo6 dodo7; do
#        scp environment.yml kti

# usage: username server1 server2...

arguments=("$@") 
echo -n "logging into username " $1 "on" ${#-1} " servers "
echo "" 
for ((i=1;i<$#;i++)); do
	echo -n  ${arguments[$i]} " "
done
echo ""
for ((i=1; i<$#;i++)); do
	echo "scp to" ${arguments[$i]}
	echo "---------------------------------------"
done
for ((i=1;i<$#;i++)); do
	echo "conda env update"
	echo "---------------------------------------"
	ssh $1@${arguments[$i]}  "conda env update --prefix ./anaconda3 --file environment.yml --prune;"
done

