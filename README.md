docker-phabricator
==================
Dockerfile with debian:jessie / mysql / phabricator


Run
----
```
docker run yesnault/docker-phabricator
```

You have to wait a bit until the container finishes the preparation (creation of database).

Build and run
---------------

```
git clone https://github.com/yesnault/docker-phabricator.git
./build.sh
./run-server.sh
````

Go to http://localhost:8081

You can connect into container with this command :
```
docker exec -it <containerId> bash
```

Mysql files are written on `/data/phabricator/mysql` (described in run-server.sh)

Conf files are written on `/data/phabricator/conf` (described in run-server.sh)

Repositories files are written on `/data/phabricator/repo` (described in run-server.sh)

