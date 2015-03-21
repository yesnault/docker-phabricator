#
# Docker image for running https://github.com/phacility/phabricator
#

FROM    debian:jessie
MAINTAINER  Daniel Nephin <dnephin@gmail.com> 

# TODO: review this dependency list
RUN     DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
	        git \
            apache2 \
            curl \
            libapache2-mod-php5 \
            libmysqlclient18 \
            mercurial \
            mysql-client \
            php-apc \
            php5 \
            php5-apcu \
            php5-cli \
            php5-curl \
            php5-gd \
            php5-json \
            php5-ldap \
            php5-mysql \
            subversion \
            tar \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

# For some reason phabricator doesn't have tagged releases. To support 
# repeatable builds use the latest SHA
ADD     download.sh /opt/download.sh
WORKDIR /opt
RUN     bash download.sh phabricator 5aca529980
RUN     bash download.sh arcanist    1a2829d281
RUN     bash download.sh libphutil   ce3959b404


# Setup apache
RUN     a2enmod rewrite
ADD     phabricator.conf /etc/apache2/sites-available/phabricator.conf
RUN     ln -s /etc/apache2/sites-available/phabricator.conf \
            /etc/apache2/sites-enabled/phabricator.conf && \
        rm -f /etc/apache2/sites-enabled/000-default.conf

# Setup phabricator
RUN     mkdir -p /opt/phabricator/conf/local /var/repo
ADD     local.json /opt/phabricator/conf/local/local.json


EXPOSE  80
CMD     bash -c "source /etc/apache2/envvars; /usr/sbin/apache2 -DFOREGROUND"
