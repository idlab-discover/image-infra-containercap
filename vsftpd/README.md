# vsftpd server

A minimal container image with openssh server starting from the ubuntu base images.

A container image with a hardened vsftpd server from the Ubuntu 24.04 base image. Notable configuration:
- FTP user: greg, FTP password: greg
- Guest and anonymous access are not allowed
- At the moment, there is no support for virtual users
- Access is contained by using chroot jail
- The PASV port range is severly limited to prevent long build times (38426-38458)
- SSL is enabled: A 2048 bit RSA key is generated at runtime, along with a self-signed certificate
- The private key is not encrypted, as vsftpd does not support this