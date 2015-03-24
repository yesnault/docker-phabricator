docker-phabricator
==================
A docker composition for Phabricator :
- One container used by mysql, see https://github.com/yesnault/docker-phabricator/tree/master/database
- One container used by apache (phabricator)

Run with image from hub.docker.com
----
Run a mysql container :
```
docker run --name databasePhabricator yesnault/docker-phabricator-mysql
```

Run phabricator :
```
docker run -p 8081:80 --link databasePhabricator:database yesnault/docker-phabricator 
```
Go to http://localhost:8081


Local Build and Run
----
```
docker-compose up -d
```
Go to http://localhost:8081



Local Build and Run on osx
-------
docker-compose does not working yet on osx, please use http://www.fig.sh
```
fig -f docker-compose.yml up
```
Go to http://localhost:8081
