######
#
# Install plex-media-server
#
######

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

ADD http://downloads.plexapp.com/plex-media-server/0.9.8.6.175-88ffbb2/plexmediaserver_0.9.8.6.175-88ffbb2_amd64.deb /plexmediaserver.deb

RUN apt-get update && apt-get -y upgrade && apt-get -y install avahi-daemon avahi-utils
RUN dpkg -i /plexmediaserver.deb

ENTRYPOINT ["/usr/sbin/start_pms"]
EXPOSE 32400 1900/udp 32469/udp 5353 5353/udp

