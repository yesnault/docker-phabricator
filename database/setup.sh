#/bin/bash
#
# Set up the mysql database with tables and users
#

set -eu
set -o pipefail

echo "init mysql admin user"
mysql_install_db
mysqld_safe &
# TODO: replace sleep with polling
sleep 10s

echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
cat /opt/phabricator/resources/sql/quickstart.sql | mysql

# TODO: create a default admin account
# TODO: address setup issues described in /config/issue/

pkill -f mysqld
