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

Running on OSX
-------

Requires

  * boot2docker

  * docker

From a terminal, execute:

```
docker-compose up
```

and then execute

```
boot2docker ip
```

Then open up a browser and navigate to

```
http://{boot2docker ip}:8081
```
