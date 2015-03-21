#
# Docker image for the phabricator database
#

FROM    mysql:5.6
MAINTAINER  Daniel Nephin <dnephin@gmail.com> 

ADD     .   /opt/mysql
RUN     sed -i -e "s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" \
            /etc/mysql/my.cnf && \
        cat /opt/mysql/my-phabricator.cnf >> /etc/mysql/my.cnf
RUN     bash /opt/mysql/setup.sh
