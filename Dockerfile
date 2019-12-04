FROM debian:stable-slim

# Directories
ENV PROFTPD_DIR=/etc/proftpd
ENV FRX_WEB_DIR=/var/customers/webs

# Time and location
ENV TZ=Europe/Berlin
ENV LOCALE="de_DE.UTF-8 UTF-8"

# Froxlor
ENV FRX_DB_HOST=localhost
ENV FRX_DB_NAME=froxlor
ENV FRX_DB_USER=froxlor
ENV FRX_DB_PASSWORD=""

# ProFTPd
ENV SERVER_NAME="Froxlor FTP server"
ENV USE_IP6=off
ENV FTP_PORT=21

# SFTP
ENV SFTP=off
ENV SFTP_PORT=22

# Ports
EXPOSE 21
EXPOSE 22

# Update and upgrade package repositories
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# Install packages
RUN apt-get install -y --no-install-recommends \
	  apt-utils \
	  gettext-base \
    locales \
    logrotate \
    ca-certificates \
    unattended-upgrades \
    apt-listchanges \
    syslog-ng

# Install OpenSSH
RUN apt-get install -y --no-install-recommends \
	  openssh-server

# Install ProFTPd
RUN apt-get install -y --no-install-recommends \
    proftpd-basic \
    proftpd-mod-mysql \
    proftpd-mod-clamav

# Create folders
RUN mkdir -p ${FRX_WEB_DIR}

# Configure ProFTPd
COPY ./etc/proftpd /etc/proftpd/

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]
