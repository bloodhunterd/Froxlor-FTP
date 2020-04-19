FROM debian:stable-slim

# Time
ENV TZ=Europe/Berlin

# Froxlor
ENV FRX_WEB_DIR=/var/customers/webs
ENV FRX_DB_HOST=localhost
ENV FRX_DB_NAME=froxlor
ENV FRX_DB_USER=froxlor
ENV FRX_DB_PASSWORD=""

# ProFTPd
ENV SERVER_NAME="Froxlor FTP Server"

# Ports
EXPOSE 21

# Update sources and preinstalled packages
RUN apt-get update && \
    apt-get upgrade -y --no-install-recommends

# Install dependencies
RUN apt-get install -y --no-install-recommends \
	apt-utils \
	gettext-base \
    logrotate \
    ca-certificates \
    unattended-upgrades \
    apt-listchanges \
    syslog-ng

# Install OpenSSH
RUN apt-get install -y --no-install-recommends \
	openssh-server

# Clear default host keys (needed for ProFTPd version <= 1.3.6)
RUN rm /etc/ssh/ssh_host_rsa_key && \
    rm /etc/ssh/ssh_host_ecdsa_key

# Install ProFTPd
RUN apt-get install -y --no-install-recommends \
    proftpd-basic \
    proftpd-mod-mysql

# Create folders
RUN mkdir -p ${FRX_WEB_DIR}

# Configure ProFTPd
COPY ./etc/proftpd /etc/proftpd/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
