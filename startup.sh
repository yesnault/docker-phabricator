#/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then

	echo "init Mysql admin user"
	killall mysqld

	mysql_install_db

	mysqld_safe &
	sleep 10s

	echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
fi

cd /opt/
git clone git://github.com/facebook/libphutil.git
git clone git://github.com/facebook/arcanist.git
git clone git://github.com/facebook/phabricator.git
cd /opt/phabricator && ./bin/storage upgrade --force

