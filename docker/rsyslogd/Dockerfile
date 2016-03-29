FROM rightscale/ops_ruby21x_build:latest

RUN rm /etc/rsyslog.conf
COPY rsyslog.conf /etc/

VOLUME ["/dev", "/var/log"]

CMD ["/usr/sbin/rsyslogd", "-n"]

EXPOSE 514
