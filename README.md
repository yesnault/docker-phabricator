docker-phabricator
==================
Dockerfile with ubuntu / mysql / phabricator

 
```
git clone https://github.com/yesnault/docker-phabricator.git
./build.sh
./run-server.sh
````

Go to http://localhost.local:8081

Docker HTTP listen on 8081 and ssh listen on 2244 (user : root, password : docker)

Mysql files are written on `/data/mysql` (described in run-server.sh)
