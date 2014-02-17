#/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then

	mysql_install_db

	/usr/bin/mysqld_safe &
	sleep 10s

	echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

	killall mysqld
	sleep 10s
fi

echo "Activate phabricator"
ln -s /etc/apache2/sites-available/phabricator.conf /etc/apache2/sites-enabled/phabricator.conf
echo "Run apache"
apache2ctl restart

echo "Run mysqld_safe"
/usr/bin/mysqld_safe &

echo "Run SSHD"
mkdir /var/run/sshd
/usr/sbin/sshd -D

echo "Settup ulimit"
ulimit -c 10000

cd /opt/ && chmod +x installPhabricator.sh
echo "Run installPhabricator.sh"
./installPhabricator.sh
