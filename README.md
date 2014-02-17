docker-phabricator
==================
Dockerfile with ubuntu / mysql / phabricator


Documentation is coming soon ...

Draft for dev (osx / windows) / building Dockerfile (not yes on index.docker.io) :

Install vagrant
Install virtualBox
Clone docker, go to docker directory
export FORWARD_PORTS=8081
vagrant up; 
vagrant ssh; 
clone yesnault/docker-phabricator
./build.sh; ./run-server.sh and go to http://localhost.local:8081

Docker HTTP listen on 8081 and ssh listen on 2244

