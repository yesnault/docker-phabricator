docker-phabricator
==================
Dockerfile with ubuntu / mysql / phabricator


Documentation is coming soon ...

Draft for dev (osx / windows) / building Dockerfile (not yes on index.docker.io) :

- Install vagrant (http://www.vagrantup.com/downloads.html)
- Install virtualBox

 
```
git clone https://github.com/dotcloud/docker.git

export FORWARD_PORTS=8081
vagrant up 
vagrant ssh
git clone https://github.com/yesnault/docker-phabricator.git
./build.sh
./run-server.sh
````

Go to http://localhost.local:8081

Docker HTTP listen on 8081 and ssh listen on 2244

Mysql files are written on `/data/mysql` (described in run-server.sh)
