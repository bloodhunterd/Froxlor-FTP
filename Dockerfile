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

# Clear default host keys (needed for ProFTPd version <= 1.3.6)
RUN rm /etc/ssh/ssh_host_rsa_key && \
    rm /etc/ssh/ssh_host_ecdsa_key

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

# ===================================================
# Entrypoint
# ===================================================

ENTRYPOINT ["bash", "/start.sh"]
