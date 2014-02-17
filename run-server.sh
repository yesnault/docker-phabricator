#!/bin/sh

docker run -i -d -p 3306:3306 -p 8081:80 -p 2244:22 -privileged  -v /data/mysql:/var/lib/mysql yesnault/phabricator 

