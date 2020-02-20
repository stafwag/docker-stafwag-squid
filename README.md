# docker-stafwag-squid

```Dockerfile``` to run squid inside a docker container.
The squid daemon will run as the proxy user. The proxy/group is mapped
to 50013 uid/gid.

## Installation

### clone the git repo

```
$ git clone https://github.com/stafwag/docker-stafwag-squid.git
$ cd docker-stafwag-squid
```

### Update squid.conf

```
$ vi etc/squid.conf 
```

### Build the image

```
$ docker build -t stafwag/squid . 
```

### Create a directory for the squid cache

```
$ sudo mkdir -p home/volumes/docker/squid/cache
$ sudo chown 50013:50013 /home/volumes/docker/squid/cache
```

## Run

Execute the run shell script.

```
$ ./run.sh
```

Or run the docker command:

```
CACHEDIR_VOLUME=/home/volumes/docker/squid/cache

docker run -d --name myproxy --rm -v $CACHEDIR_VOLUME:/var/spool/squid -p 3128:3128 stafwag/squid
```

***Have fun***
