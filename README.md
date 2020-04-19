[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-ftp-docker?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp-docker/releases)
[![Docker Build](https://img.shields.io/docker/cloud/build/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-ftp)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-ftp-docker?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/LICENSE)

# Froxlor FTP

Docker Image of Froxlor FTP Server.

## Configuration

See example [Docker Compose file](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/docker-compose.yml).

### Docker environment

| ENV | Values¹ | Default | Description
|--- |--- |--- |---
| TZ | [PHP: List of supported timezones - Manual](https://www.php.net/manual/en/timezones.php) | Europe/Berlin | Timezone.
| FRX_WEB_DIR | *Absolute path* | /var/customers/webs | Path to the Froxlor customer web.
| FRX_DB_HOST | *Hostname / IP* | localhost | Froxlor database hostname or IP
| FRX_DB_NAME | *Database name* | froxlor | Froxlor database name
| FRX_DB_USER | *Database user* | froxlor | Froxlor database user
| FRX_DB_PASSWORD | *Database user password* |  | Froxlor database user password
| SERVER_NAME | *Hostname* | Froxlor FTP Server | Public server name

¹ *Possible values are separated by a slash or a range is indicated by a dash.*

### Volumes

```bash
volumes:
  - ./webs/:/var/customers/webs/
  - ./ssh_host_rsa_key:/etc/ssh/ssh_host_rsa_key:ro
  - ./ssh_host_ecdsa_key:/etc/ssh/ssh_host_ecdsa_key:ro
```

## Update

Please note the [changelog](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/CHANGELOG.md) to check for configuration changes before updating.

## Build With

* [ProFTPD](http://www.proftpd.org/)
* [OpenSSH](https://www.openssh.com/)
* [Debian](https://www.debian.org/)
* [Docker](https://www.docker.com/)

## Authors

* [BloodhunterD](https://github.com/bloodhunterd)

## License

This project is licensed under the Unlicense - see [LICENSE.md](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/LICENSE) file for details.
