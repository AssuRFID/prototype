#!/bin/bash
# Process card numbers
while read -r i ; do
	if grep --quiet $i /root/prototype/allowed ; then
		echo 'Code recognised and valid, open'
		if [ master = true ] ; then
			echo 'Tag No $i removed from valid tags' # Make tag invalid using master tag
			sed -i '/$i/d' /root/prototype/allowed
		fi
	elif grep --quiet $i /root/prototype/disallowed ; then
		echo 'Code recognised but invalid, close'
		if [ master = true ] ; then
			echo 'Tag No $i added to valid tags'
			echo $i >> /root/prototype/allowed  # Make tag invalid using master tag
	elif grep --quiet $i /root/prototype/masters ; then
		echo 'Master key'
		master=ture
	else
		if [ master = true ] ; then
			echo "New tag No. $i added to valid tags"
			echo $i >> /root/prototype/allowed  # Add completely new tags using master tag
		fi
	fi
done
