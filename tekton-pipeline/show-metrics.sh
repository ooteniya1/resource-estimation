
#!/bin/bash

kubectl top pod --selector='app=todo-spring' | sed -n 1p
 count=0;
while true; do 
	count=$((count + 1))
	#kubectl top pod --selector='app=todo-spring' | sed -n 2p | awk '{print $2}' | xargs rm) > /dev/null
	echo '--' $(date +"%T")
	kubectl top pod --selector='app=todo-spring' | sed -n 2,4p
	
	sleep 5
	
done
