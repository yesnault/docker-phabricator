#!/bin/sh

docker run -i -d -p 8081:80 -v /data/phabricator/mysql:/var/lib/mysql -v /data/phabricator/repo:/var/repo -v /data/phabricator/conf:/opt/phabricator/conf yesnault/docker-phabricator

