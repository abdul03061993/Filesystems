#!/bin/bash


TEST=$(df -Th | grep -E "xvd|root" | awk '{print $1}')

echo -e "$TEST"
MAX=80

for i in ${TEST[@]}
do
	VALUE=$(df -Th | grep -i $i | awk '{print $6}' | cut -d % -f1)

	if [[ ${VALUE%?} -ge ${MAX%?} ]]; then
		echo -e "The Disk $i has been utilized ${VALUE}% ; Check it immediately" 
	else
	
		echo -e "The Disk $i has not been utilized"
	fi
done


