FROM ubuntu:24.04
# Install vsftpd
RUN apt-get update -y \
  && apt-get install -y vsftpd \
  && rm -rf /var/lib/apt/lists/*
# Copy vsftpd configuration file and setup script
COPY config/setup.sh /var/tmp/setup.sh
# Make the setup script executable and run it
RUN chmod +x /var/tmp/setup.sh && /var/tmp/setup.sh
# The following ports are needed for FTP
EXPOSE 20 21
# (Re)start the service
CMD ["/usr/sbin/vsftpd"]