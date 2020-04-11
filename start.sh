#!/bin/bash

# Set timezone
ln -snf "/usr/share/zoneinfo/${TZ}" etc/localtime
echo "${TZ}" > /etc/timezone

# Get config files
r=()
r+=("$(find /etc/proftpd -type f -name '*.conf')")

# Replace environment vars
for d in "${r[@]}"
do
	for f in $d
	do
		# Replace only if not mounted as read-only
		if [ -w "$f" ]
		then
			t="$f.tmp"
			mv $f $t
			envsubst < $t > $f
			rm $t
		fi
	done
done

proftpd -n
