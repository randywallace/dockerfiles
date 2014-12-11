FROM ubuntu:14.04

MAINTAINER 'Randy D. Wallace Jr.'

RUN locale-gen en_US en_US.UTF-8 ;\
    dpkg-reconfigure locales

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN DEBIAN_FRONTEND=noninteractive apt-get -y update ;\
    DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common ;\
    apt-add-repository ppa:brightbox/ruby-ng ;\
    DEBIAN_FRONTEND=noninteractive apt-get update ;\
    DEBIAN_FRONTEND=noninteractive apt-get -y upgrade ;\
    DEBIAN_FRONTEND=noninteractive apt-get install -y ruby2.1 \
                                                      ruby2.1-dev \
                                                      git \
                                                      wget \
                                                      postgresql \
                                                      postgresql-client \
                                                      postgresql-contrib \
                                                      libpq-dev \
                                                      nodejs \
                                                      libxslt-dev \
                                                      libxml2-dev \
                                                      redis-server \
                                                      nginx \
                                                      build-essential \
                                                      autoconf \
                                                      libtool \
                                                      pkg-config

USER postgres

RUN service postgresql start ;\
    psql --command "CREATE USER root WITH SUPERUSER PASSWORD '';" ;\
    createdb -O root asciinema_production ;\
    createdb -O root asciinema_development ;\
    service postgresql stop

USER root

RUN echo 'install: --no-rdoc --no-ri\nupdate:  --no-rdoc --no-ri' > ~/.gemrc ;\
    gem install bundler therubyracer

RUN cd /opt ;\
    git clone git://people.freedesktop.org/~dvdhrm/libtsm ;\
    cd libtsm ;\
    git checkout bb4e454 ;\
    NOCONFIGURE=1 ./autogen.sh ;\
    ./configure --prefix=/usr/local ;\
    make && make install ;\
    ldconfig ;\
    cd .. ;\
    git clone git://github.com/sickill/asciinema.org.git ;\
    cd asciinema.org ;\
    service postgresql start ;\
    cp config/database.yml.example config/database.yml ;\
    cd src && make && cd .. ;\
    bundle install ;\
    RAILS_ENV='development' bundle exec rake db:setup ;\
    RAILS_ENV='production' bundle exec rake db:setup ;\
    service postgresql stop 

ADD startup.sh /startup.sh

CMD /startup.sh

