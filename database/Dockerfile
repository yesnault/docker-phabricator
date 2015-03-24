#
# Docker image for the phabricator database
#

FROM    debian:jessie
MAINTAINER  Yvonnick Esnault <yvonnick@esnau.lt>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

RUN   apt-get update && apt-get install -y \
      curl \
      mysql-server

RUN     sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" \
            /etc/mysql/my.cnf
ADD     my-phabricator.cnf /etc/mysql/conf.d/my-phabricator.cnf

ADD     download.sh /opt/mysql/download.sh
RUN     bash /opt/mysql/download.sh

ADD     setup.sh /opt/mysql/setup.sh
RUN     bash /opt/mysql/setup.sh

VOLUME  ["/var/lib/mysql"]
CMD     mysqld_safe
