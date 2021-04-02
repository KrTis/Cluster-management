# simple script to distribute command over a cluster
# usage . anaconda_ssh_update.sh username server1 server2 ...
echo "Exporting active conda env to environment.yml"
conda env export > environment.yml

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
	ssh $1@${arguments[$i]}  "conda env update --prefix ./anaconda3 --file environment.yml --prune;" &
done
wait
