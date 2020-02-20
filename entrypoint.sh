#!/bin/sh

CACHE_DIR=/var/spool/squid

if [ ! -d "$CACHE_DIR" ]; then
  echo "ERROR: Sorry, ${CACHE_DIR} isn't a directory."
  exit 1

fi

if [ ! -d ${CACHE_DIR}/00 ]; then
  squid -z
  sleep 2
fi

squid --foreground
