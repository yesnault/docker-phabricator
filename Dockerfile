FROM ubuntu

MAINTAINER Yvonnick Esnault <yvonnick@esnau.lt>
 
#RUN dpkg-divert --local --rename --add /sbin/initctl
#RUN ln -s /bin/true /sbin/initctl
 
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
 
RUN apt-get -y install mysql-client mysql-server git mysql-server apache2 dpkg-dev  php5 php5-mysql php5-gd php5-dev php5-curl php-apc php5-cli php5-json ssh

RUN a2enmod rewrite
 
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
 
ADD ./startup.sh /opt/startup.sh
ADD ./installPhabricator.sh /opt/installPhabricator.sh

ADD files/apache_vhost.conf /etc/apache2/sites-available/phabricator.conf
ADD files/supervisord.conf /etc/
 
EXPOSE 3306 80 22
 
CMD ["/bin/bash", "/opt/startup.sh"]

