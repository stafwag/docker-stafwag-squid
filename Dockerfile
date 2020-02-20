FROM debian:buster
LABEL maintainer "staf wagemakers <staf@wagemakers.be>"
RUN  usermod proxy -u 50013
RUN  groupmod proxy -g 50013

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install squid -y
COPY etc/squid.conf /etc/squid/squid.conf

RUN mkdir /home/proxy
RUN chown proxy:proxy /home/proxy
COPY entrypoint.sh /home/proxy

USER proxy
WORKDIR /home/proxy

EXPOSE 3128

ENTRYPOINT /home/proxy/entrypoint.sh
