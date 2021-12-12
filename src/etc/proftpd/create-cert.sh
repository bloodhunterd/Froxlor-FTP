#!/bin/bash
[ -f /etc/ssl/certs/proftpd.crt ] || openssl req -new -x509 -newkey rsa:${TLS_CERT_BITS} -days ${TLS_CERT_DAYS} -nodes -out /etc/ssl/certs/proftpd.crt -keyout /etc/ssl/private/proftpd.key -subj "/C=${TLS_CERT_COUNTRY}/ST=${TLS_CERT_STATE}/O=${TLS_CERT_ORGANIZATION}/CN=${TLS_CERT_COMMON_NAME}"
[ -f /etc/ssl/certs/proftpd_ec.crt ] || openssl req -new -x509 -nodes -newkey ec:<(openssl ecparam -name secp521r1) -keyout /etc/ssl/private/proftpd_ec.key -out /etc/ssl/certs/proftpd_ec.crt -days ${TLS_CERT_DAYS} -subj "/C=${TLS_CERT_COUNTRY}/ST=${TLS_CERT_STATE}/O=${TLS_CERT_ORGANIZATION}/CN=${TLS_CERT_COMMON_NAME}"
chmod 0600 /etc/ssl/private/proftpd.key /etc/ssl/private/proftpd_ec.key
