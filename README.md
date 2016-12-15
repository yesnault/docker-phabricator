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
docker run -p 8080:80 --link databasePhabricator:database yesnault/docker-phabricator 
```
Go to http://127.0.0.1:8080

Running on OSX
-------


###### Docker for Mac
From a terminal, execute:

```
docker-compose up
```

Go to http://127.0.0.1:8080


###### Boot2 Docker

Requires

  * Docker

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
http://{boot2docker ip}:8080
```
