FROM debian:jessie

MAINTAINER Yvonnick Esnault <yvonnick@esnau.lt>

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

ADD ./startup.sh /opt/startup.sh

RUN apt-get update && apt-get install -y wget vim less zip cron lsof sudo screen dpkg \
					supervisor mysql-server mysql-client libmysqlclient-dev \
					apache2 php5 libapache2-mod-php5 php5-mcrypt php5-mysql \
					php5-gd php5-dev php5-curl php5-cli php5-json php5-ldap php5-apcu \ 
					git subversion mercurial && \
	mkdir -p /var/log/supervisor && \
	a2enmod rewrite && \
	sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf && \
	sed -i 's/\[mysqld\]/[mysqld]\n#\n# * Phabricator specific settings\n#\nsql_mode=STRICT_ALL_TABLES\nft_stopword_file=\/opt\/phabricator\/resources\/sql\/stopwords.txt\nft_min_word_len=3\ninnodb_buffer_pool_size=410M\n/' /etc/mysql/my.cnf && \
	chmod +x /opt/startup.sh && \
	cd /opt/ && git clone https://github.com/facebook/libphutil.git && \
	cd /opt/ && git clone https://github.com/facebook/arcanist.git && \
	cd /opt/ && git clone https://github.com/facebook/phabricator.git && \
	mkdir -p '/var/repo/' && \
	ulimit -c 10000 && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD phabricator.conf /etc/apache2/sites-available/phabricator.conf

RUN ln -s /etc/apache2/sites-available/phabricator.conf /etc/apache2/sites-enabled/phabricator.conf && \
	rm -f /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80

CMD ["/usr/bin/supervisord"]
