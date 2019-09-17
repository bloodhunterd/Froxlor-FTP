#!/bin/bash

# Set timezone
ln -snf "/usr/share/zoneinfo/${TZ}" etc/localtime && echo "${TZ}" > /etc/timezone && \

# Set locales
echo "${LOCALE}" >> /etc/locale.gen && locale-gen

# Generate SSL certificates, if enabled
if [ -n "${ENABLE_FTPS}" ]; then
	if [ ! -f /etc/ssl/certs/proftpd.crt ]; then
		openssl req -new -x509 -newkey rsa:4096 -days 3650 -nodes -out /etc/ssl/certs/proftpd.crt -keyout /etc/ssl/private/proftpd.key -subj "/C=${FTPS_CERT_COUNTRY}/ST=${FTPS_CERT_STATE}/O=${FTPS_CERT_ORG}/CN=${FTPS_CERT_DOMAIN}"
	fi
	if [ ! -f /etc/ssl/certs/proftpd_ec.crt ]; then
		openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp521r1) -keyout /etc/ssl/private/proftpd_ec.key -out /etc/ssl/certs/proftpd_ec.crt -days 3650 -subj "/C=${FTPS_CERT_COUNTRY}/ST=${FTPS_CERT_STATE}/O=${FTPS_CERT_ORG}/CN=${FTPS_CERT_DOMAIN}"
	fi
fi

# Start ProFTPd in foreground
proftpd -n
