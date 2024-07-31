# OpenSSH Server

A minimal container image with openssh server starting from the ubuntu base images.

- **Ubuntu OpenSSH Server**: https://ubuntu.com/server/docs/openssh-server
- **sshd_config**: https://manpages.ubuntu.com/manpages/xenial/man5/sshd_config.5.html

## Container Images Overview

This project contains multiple Dockerfiles for different configurations of an OpenSSH server. Each configuration is specified using different tags and configuration files.

| Tag             | From                | Config              | Description                                         |
|-----------------|---------------------|---------------------|-----------------------------------------------------|
| password-16.04  | `ubuntu:16.04`      | `password-setup.sh` | Password authentication enabled, except for `root`. |
| password-24.04  | `ubuntu:24.04`      | `password-setup.sh` | Password authentication enabled, except for `root`. |
