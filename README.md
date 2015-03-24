docker-phabricator
==================
A docker composition for Phabricator :
- One container used by mysql
- One container used by apache (pharicator)

Run with image from hub.docker.com
----
Run a mysql container :
```
docker run --name databasePhabricator yesnault/docker-phabricator-mysql
```

Run phabricator :
```
docker run yesnault/docker-phabricator --link databasePhabricator:database
```


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
