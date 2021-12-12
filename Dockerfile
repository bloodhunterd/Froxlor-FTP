FROM debian:stable-slim

# ===================================================
# Configuration
# ===================================================

# Froxlor
ENV FRX_WEB_DIR='/var/customers/webs'
ENV FRX_DB_HOST='localhost'
ENV FRX_DB_NAME='froxlor'
ENV FRX_DB_USER='froxlor'
ENV FRX_DB_PASSWORD=''

# ProFTPd
ENV SERVER_NAME='Froxlor FTP'

# Time
ENV TZ='Europe/Berlin'

# SFTP
ENV SFTP_PORT=21
ENV SFTP_ENGINE='on'

# TLS
ENV TLS_CERT_BITS=2048
ENV TLS_CERT_COMMON_NAME=''
ENV TLS_CERT_COUNTRY=''
ENV TLS_CERT_DAYS=3652
ENV TLS_CERT_ORGANIZATION=''
ENV TLS_CERT_STATE=''
ENV TLS_ENGINE='off'
ENV TLS_PROTOCOLS='TLSv1 TLSv1.1 TLSv1.2'

# ===================================================
# Ports
# ===================================================

EXPOSE 21

# ===================================================
# Base packages
# ===================================================

RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

RUN apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
	gettext-base \
    syslog-ng \
    unattended-upgrades

# ===================================================
# OpenSSH
# ===================================================

RUN apt-get install -y --no-install-recommends \
	openssh-server

# ===================================================
# ProFTPD
# ===================================================

RUN apt-get install -y --no-install-recommends \
    proftpd-basic \
    proftpd-mod-mysql

RUN mkdir -p ${FRX_WEB_DIR}

# ===================================================
# Filesystem
# ===================================================

COPY ./src/ /

RUN chmod 0700 "/etc/proftpd/create-cert.sh" && \
    chown root:0 "/etc/proftpd/create-cert.sh" && \
    chmod 0600 "/etc/proftpd/proftpd.conf" && \
    chown root:0 "/etc/proftpd/proftpd.conf" && \
    chmod 0644 "/etc/proftpd/modules.conf" && \
    chown root:0 "/etc/proftpd/modules.conf" && \
    chmod 0600 "/etc/proftpd/sql.conf" && \
    chown root:0 "/etc/proftpd/sql.conf" && \
    chmod 0644 "/etc/proftpd/tls.conf" && \
    chown root:root "/etc/proftpd/tls.conf"

# ===================================================
# Entrypoint
# ===================================================

ENTRYPOINT ["bash", "/start.sh"]
