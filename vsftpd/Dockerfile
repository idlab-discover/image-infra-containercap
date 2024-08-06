FROM ubuntu:24.04

RUN apt-get update -y \
  && apt-get install -y vsftpd \
  && rm -rf /var/lib/apt/lists/*

COPY config/vsftpd.conf /etc/vsftpd.conf
COPY scripts/setup.sh /var/tmp/setup.sh

RUN chmod +x /var/tmp/setup.sh

RUN sed -i 's,\r,,;s, *$,,' /etc/vsftpd.conf
RUN sed -i 's,\r,,;s, *$,,' /var/tmp/setup.sh

EXPOSE 20 21

CMD ["/var/tmp/setup.sh"]