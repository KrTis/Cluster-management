# simple script to distribute command over a cluster
# usage . kill_python.sh username server1 server2 ...

arguments=("$@") 
echo -n "logging into username " $1 "on" ${#-1} " servers "
echo "" 
for ((i=1;i<$#;i++)); do
	echo -n  ${arguments[$i]} " "
done
echo ""

for ((i=1;i<$#;i++)); do
	echo "killall -u " $1 "python at" ${arguments[$i]}
	echo "---------------------------------------"
	ssh $1@${arguments[$i]}  "killall -u " $1 " python" 
done

