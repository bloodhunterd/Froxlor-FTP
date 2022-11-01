[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp/releases)
[![Docker Build](https://img.shields.io/github/workflow/status/bloodhunterd/froxlor-ftp/Docker?style=for-the-badge&label=Docker%20Build)](https://github.com/bloodhunterd/froxlor-ftp/actions?query=workflow%3ADocker)
[![Docker Pulls](https://img.shields.io/docker/pulls/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-ftp)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp/blob/master/LICENSE)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bloodhunterd)

# Froxlor FTP

Docker image of ProFTPD for Froxlor Server Management Panel.

*This image is meant to be used with the [Froxlor](https://github.com/bloodhunterd/Froxlor) image.*

## Deployment

### Docker Compose

~~~dockerfile
version: "2.4"

services:
  ftp:
    image: bloodhunterd/froxlor-ftp
    ports:
      - "21:21"
    volumes:
      - ./webs/:/var/customers/webs/
~~~

### Environment

#### Common

| ENV         | Default       | Description                                                                               |
|-------------|---------------|-------------------------------------------------------------------------------------------|
| SERVER_NAME | Froxlor FTP   | Public server name.                                                                       |
| TZ          | Europe/Berlin | [PHP: List of supported timezones - Manual](https://www.php.net/manual/en/timezones.php). |

#### Froxlor

| ENV             | Default             | Description                       |
|-----------------|---------------------|-----------------------------------|
| FRX_WEB_DIR     | /var/customers/webs | Path to the Froxlor customer web. |
| FRX_DB_HOST     | localhost           | Froxlor database hostname or IP.  |
| FRX_DB_NAME     | froxlor             | Froxlor database name.            |
| FRX_DB_USER     | froxlor             | Froxlor database user.            |
| FRX_DB_PASSWORD |                     | Froxlor database user password.   |

#### SFTP

| ENV         | Default | Description                                                      |
|-------------|:-------:|------------------------------------------------------------------|
| SFTP_ENGINE |   on    | Enable/disable SFTP service. Valid values are **on** or **off**. |
| SFTP_PORT   |   21    | Port of the SFTP service.                                        |

#### FTPS

| ENV                   |     Default     | Description                                                      |
|-----------------------|:---------------:|------------------------------------------------------------------|
| TLS_CERT_BITS         |      2048       | Certificate strength in bits.                                    |
| TLS_CERT_COMMON_NAME  |    localhost    | Certificate domain.                                              |
| TLS_CERT_COUNTRY      |                 | Country of the certificate issuer.                               |
| TLS_CERT_DAYS         |      3652       | Time in days the certificate is valid.                           |
| TLS_CERT_ORGANIZATION |                 | Organization of the certificate issuer.                          |
| TLS_CERT_STATE        |                 | State of the certificate issuer.                                 |
| TLS_ENGINE            |       off       | Enable/disable FTPS service. Valid values are **on** or **off**. |
| TLS_PROTOCOLS         | TLSv1.2 TLSv1.3 | Space separated TLS protocol versions.                           |

### Ports

| Port | Description                     |
|-----:|---------------------------------|
|   21 | Port for FTP, FTPS and/or SFTP. |

### Volumes

| Volume            | Path                 | Read only | Description                     |
|-------------------|----------------------|:---------:|---------------------------------|
| Froxlor customers | /var/customers/webs/ | &#10006;  | Froxlor customer web directory. |

## Update

Please note the [changelog](https://github.com/bloodhunterd/froxlor-ftp/blob/master/CHANGELOG.md) to check for configuration changes before updating.

## Build With

* [ProFTPD](http://www.proftpd.org/)
* [OpenSSH](https://www.openssh.com/)
* [Debian](https://www.debian.org/)
* [Docker](https://www.docker.com/)

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/froxlor-ftp/blob/master/LICENSE) file for details.
