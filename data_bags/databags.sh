#!/bin/bash

databag_file="data_bags/databags.txt"
data_bags_list=`knife data bag list 2>/dev/null`
databags={$data_bags_list}


lines=`cat $databag_file`
for line in $lines; do
		found=0
		for i in ${data_bags_list[@]}
		do 
			#echo "checking for $i in $line"
			if [ "$i" == "$line" ] ; then
				found=1
        	fi
        done
        if [ $found == 0 ] ; then
        	echo "creating data bag $line..."
        	output=`/usr/local/bin/knife data bag create $line` 2>/dev/null
        fi
done


containsElement () {
  local e
  for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
  return 1
}


#knife data bag create user 
#knife data bag create group 
#knife data bag create mysql
#knife data bag create app
