#/bin/bash

echo "init mysql admin user"
mysql_install_db
mysqld_safe &
# TODO: replace with polling
sleep 10s

echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

# TODO: what do these do?
cd /opt/phabricator && ./bin/storage upgrade --force
cd /opt/phabricator && ./bin/phd restart
