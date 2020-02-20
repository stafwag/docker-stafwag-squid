#!/bin/sh

CACHEDIR_VOLUME=/home/volumes/docker/squid/cache

docker run -d --name myproxy --rm -v $CACHEDIR_VOLUME:/var/spool/squid -p 3128:3128 stafwag/squid
