[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp/releases)
[![Docker Build](https://img.shields.io/github/workflow/status/bloodhunterd/froxlor-ftp/Docker?style=for-the-badge&label=Docker%20Build)](https://github.com/bloodhunterd/froxlor-ftp/actions?query=workflow%3ADocker)
[![Docker Pulls](https://img.shields.io/docker/pulls/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-ftp)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp/blob/master/LICENSE)

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/bloodhunterd)

# Froxlor FTP

Docker image of ProFTPD for Froxlor Server Management Panel.

*This image is meant to be used with the [Froxlor Docker](https://github.com/bloodhunterd/froxlor-docker) image.*

## Deployment

### Docker Compose

~~~dockerfile
version: '2.4'

services:
  ftp:
    image: bloodhunterd/froxlor-ftp
    ports:
      - '21:21'
    volumes:
      - ./webs/:/var/customers/webs/
      - ./ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key:ro
      - ./ssh_host_ecdsa_key:/etc/ssh/ssh_host_ecdsa_key:ro
~~~

### Environment

| ENV | Values | Default | Description
| --- | ------ | ------- | -----------
| FRX_WEB_DIR | *Absolute path* | /var/customers/webs | Path to the Froxlor customer web.
| FRX_DB_HOST | *Hostname / IP* | localhost | Froxlor database hostname or IP.
| FRX_DB_NAME | *Database name* | froxlor | Froxlor database name.
| FRX_DB_USER | *Database user* | froxlor | Froxlor database user.
| FRX_DB_PASSWORD | *Database user password* |  | Froxlor database user password.
| SERVER_NAME | *Hostname* | Froxlor FTP Server | Public server name.
| TZ | [PHP: List of supported timezones - Manual](https://www.php.net/manual/en/timezones.php) | Europe/Berlin | Timezone.

### Ports

| Port | Description
| ---: | -----------
| 21   | FTP

### Volumes

| Volume | Path | Read only | Description
| ------ | ---- | :-------: | -----------
| Froxlor customers | /var/customers/webs/ | &#10008; | Froxlor customer web directory.
| Froxlor customers | /etc/ssh/ssh_host_rsa_key | &#10004; | SSH RSA host key. *Will be generated automatically*.
| Froxlor customers | /etc/ssh/ssh_host_ecdsa_key | &#10004; | SSH ECDSA host key. *Will be generated automatically*.

| &#10004; Yes | &#10008; No
| ------------ | -----------

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
