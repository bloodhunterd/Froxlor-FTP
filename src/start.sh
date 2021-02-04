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

# Need to generate SSH host keys in old PEM format for ProFTPd version <= 1.3.6
if [ ! -f /etc/ssh/ssh_host_rsa_key ]; then
    ssh-keygen -m PEM -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa -b 4096
fi
if [ ! -f /etc/ssh/ssh_host_ecdsa_key ]; then
    ssh-keygen -m PEM -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa -b 521
fi

proftpd -n
