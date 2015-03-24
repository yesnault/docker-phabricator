docker-phabricator
==================
A docker composition for Phabricator :
- One container used by mysql, see https://github.com/yesnault/docker-phabricator/tree/master/database
- One container used by apache (phabricator)


Run
----
```
docker-compose up -d
```
Go to http://localhost:8081



Run on osx
-------
docker-compose does not working yet on osx, please use http://www.fig.sh
```
fig -f docker-compose.yml up
```
Go to http://localhost:8081
