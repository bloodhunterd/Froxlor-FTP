FROM debian:stable-slim

# Time and location
ENV TZ=Europe/Berlin
ENV LOCALE="de_DE.UTF-8 UTF-8"

# FTPS
ENV ENABLE_FTPS=yes
ENV FTPS_CERT_COUNTRY=DE
ENV FTPS_CERT_STATE="Some State"
ENV FTPS_CERT_ORG="Acme Comp"
ENV FTPS_CERT_DOMAIN=example.com

# Update and upgrade package repositories
RUN apt-get update && apt-get upgrade -y --no-install-recommends

# Install ProFTPd and required packages
RUN apt-get install -y --no-install-recommends \
	apt-utils \
    locales \
    ca-certificates \
    unattended-upgrades \
    apt-listchanges \
    proftpd-basic \
    proftpd-mod-mysql \
    proftpd-mod-clamav

COPY ./etc/proftpd/modules.conf /etc/proftpd/modules.conf

COPY ./start.sh /start.sh

ENTRYPOINT ["bash", "/start.sh"]

EXPOSE 21
