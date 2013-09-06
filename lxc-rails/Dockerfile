######
#
# Install and run lxc-rails
#
## This actually runs like garbage right now and requires quite a bit of
## trickery to get working vis-a-vis docker-in-a-docker piping and whatnot
#
## magic incantation to somewhat get the lxc bins in a container to 
## find what they are looking for:
#
# - docker run -privileged -lxc-conf="lxc.aa_profile=unconfined" -v /var/lib/docker/containers:/var/lib/lxc -d lxc-rails
#
## As such, this is *just* a proof of concept
#
######

FROM ruby-2.0.0

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update -qq
RUN apt-get install -qqy lxc libsqlite3-dev
ADD https://github.com/randywallace/lxc-rails/archive/0.1.2.tar.gz /lxc-rails.tar.gz
RUN tar xvvf lxc-rails.tar.gz && rm lxc-rails.tar.gz 
RUN cd lxc-rails-0.1.2 && gem install bundler && bundle install


ADD start.sh /usr/local/bin/start-lxc-rails.sh
RUN chmod a+x /usr/local/bin/start-lxc-rails.sh

ENTRYPOINT ["start-lxc-rails.sh"]

EXPOSE 3000