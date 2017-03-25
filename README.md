docker-phabricator
==================

**THIS IMAGE IS UNMAINTAINED**

*If you want to use it, please update https://github.com/yesnault/docker-phabricator/blob/master/Dockerfile#L39 before docker build it.*

A docker composition for Phabricator :
- One container used by mysql, see https://github.com/yesnault/docker-phabricator/tree/master/database
- One container used by apache (phabricator)

Run with image from hub.docker.com - OUTDATED - NOT RECOMMANDED
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
