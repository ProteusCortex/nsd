FROM ubuntu:focal

ENV DEBIAN_FRONTEND noninteractive
ENV LC_ALL C.UTF-8
ENV UID=991 GID=991

RUN apt-get -qqqy update
RUN apt-get -qqqy install apt-utils

RUN apt-get -qqqy update && apt-get -qqqy dist-upgrade
RUN apt-get -qqqy install nsd tini

COPY bin /usr/local/bin
RUN chmod +x /usr/local/bin/run.sh

VOLUME ["/zones", "/etc/nsd", "/var/db/nsd"]

EXPOSE 53/tcp 53/udp 8952/tcp

CMD ["run.sh"]
