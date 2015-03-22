#
# Docker image for the phabricator database
#

FROM    debian:jessie
MAINTAINER  Daniel Nephin <dnephin@gmail.com>

RUN     DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
            curl \
            mysql-server

RUN     sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" \
            /etc/mysql/my.cnf
ADD     my-phabricator.cnf /etc/mysql/conf.d/my-phabricator.cnf

ADD     .   /opt/mysql
RUN     bash /opt/mysql/setup.sh

VOLUME  ["/var/lib/mysql"]
CMD     mysqld_safe
