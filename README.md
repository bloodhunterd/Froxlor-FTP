[![Release](https://img.shields.io/github/v/release/bloodhunterd/froxlor-ftp-docker?include_prereleases&style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp-docker/releases)
[![Docker Build](https://img.shields.io/docker/cloud/build/bloodhunterd/froxlor-ftp?style=for-the-badge)](https://hub.docker.com/r/bloodhunterd/froxlor-ftp)
[![License](https://img.shields.io/github/license/bloodhunterd/froxlor-ftp-docker?style=for-the-badge)](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/LICENSE)

# Froxlor FTP

Docker image for Froxlor FTP Server.

*This image is meant to be used with the [Froxlor Docker](https://github.com/bloodhunterd/froxlor-docker) image.*

## Configuration

See distribution [Docker Compose file](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/docker-compose.dist.yml).

### Docker environment

| ENV | Values | Default | Description
|--- |--- |--- |---
| FRX_WEB_DIR | *Absolute path* | /var/customers/webs | Path to the Froxlor customer web.
| FRX_DB_HOST | *Hostname / IP* | localhost | Froxlor database hostname or IP
| FRX_DB_NAME | *Database name* | froxlor | Froxlor database name
| FRX_DB_USER | *Database user* | froxlor | Froxlor database user
| FRX_DB_PASSWORD | *Database user password* |  | Froxlor database user password
| SERVER_NAME | *Hostname* | Froxlor FTP Server | Public server name
| TZ | [PHP: List of supported timezones - Manual](https://www.php.net/manual/en/timezones.php) | Europe/Berlin | Timezone

### Volumes

Enable access to Froxlor web directories.

```bash
volumes:
  - ./webs/:/var/customers/webs/
```

After the host SSH keys are generated they can be copied from the Docker container and mounted as read only.

```bash
volumes:
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

This project is licensed under the MIT - see [LICENSE.md](https://github.com/bloodhunterd/froxlor-ftp-docker/blob/master/LICENSE) file for details.
