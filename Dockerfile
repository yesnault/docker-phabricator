FROM ubuntu

MAINTAINER Yvonnick Esnault <yvonnick@esnau.lt>
 
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install MySQL
RUN apt-get install -y mysql-server mysql-client libmysqlclient-dev
# Install Apache
RUN apt-get install -y apache2
# Install php
RUN apt-get install -y php5 libapache2-mod-php5 php5-mcrypt php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json
# Git to retreive phabricator source
RUN apt-get install -y git
# ssh for admin
RUN apt-get install -y ssh wget
# Directory for ssh
RUN mkdir /var/run/sshd

# Supervisor
RUN apt-get install -y supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN mkdir -p /var/log/supervisor

# Enabled mod rewrite for phabticator
RUN a2enmod rewrite
 
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Set password to 'admin'
RUN printf admin\\nadmin\\n | passwd
 
ADD ./startup.sh /opt/startup.sh
RUN chmod +x /opt/startup.sh

ADD phabricator.conf /etc/apache2/sites-available/phabricator.conf
RUN ln -s /etc/apache2/sites-available/phabricator.conf /etc/apache2/sites-enabled/phabricator.conf
RUN rm -f /etc/apache2/sites-enabled/000-default

RUN ulimit -c 10000
 
EXPOSE 3306 80 22

CMD ["/usr/bin/supervisord"] 

