FROM ubuntu:12.04
MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get -y upgrade && apt-get -y install build-essential libevent-dev libncurses5-dev
RUN apt-get install -y ssh
ADD http://downloads.sourceforge.net/tmux/tmux-1.8.tar.gz /tmux-1.8.tar.gz
ADD tmux.conf /etc/tmux.conf
RUN tar xvvf tmux-1.8.tar.gz && mv tmux-1.8 tmux && cd tmux && ./configure && make && make install
ENV TERM screen-256color
ENV LANG en_US.UTF-8
CMD ["script","-c","tmux -2"]
