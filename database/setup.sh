#/bin/bash
#
# Set up the mysql database with tables and users
#

set -eu
set -o pipefail

# This should match the pinned version of the webapp
PHABRICATOR_VERSION=5aca529980
BASE_URL=https://raw.githubusercontent.com/phacility/phabricator/${PHABRICATOR_VERSION}/resources/sql/

mkdir -p /opt/phabricator/resources/sql/
cd /opt/phabricator/resources/sql/

curl -L -o stopwords.txt ${BASE_URL}/stopwords.txt
curl -L -o quickstart.sql ${BASE_URL}/quickstart.sql

# Render template `quickstart.sql`. Reproduced from
# src/infrastructure/storage/management/PhabricatorStorageManagementAPI.php
sed -i -e 's/{$CHARSET}/utf8mb4/g' quickstart.sql
sed -i -e 's/{$CHARSET_SORT}/utf8mb4/g' quickstart.sql
sed -i -e 's/{$CHARSET_FULLTEXT}/utf8mb4/g' quickstart.sql
sed -i -e 's/{$COLLATE_TEXT}/utf8mb4_bin/g' quickstart.sql
sed -i -e 's/{$COLLATE_SORT}/utf8mb4_unicode_ci/g' quickstart.sql
sed -i -e 's/{$COLLATE_FULLTEXT}/utf8mb4_unicode_ci/g' quickstart.sql
sed -i -e 's/{$NAMESPACE}/default/g' quickstart.sql


echo "init mysql admin user"
mysql_install_db
mysqld_safe &
# TODO: replace sleep with polling
sleep 10s

echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
cat quickstart.sql | mysql

pkill -f mysqld
