FROM ubuntu:14.04

MAINTAINER 'Randy D. Wallace Jr.'

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get -y update ;\
    apt-get -y upgrade ;\
    locale-gen en_US en_US.UTF-8 ;\
    dpkg-reconfigure locales 

RUN apt-get -y install git wget build-essential autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev

RUN cd /opt ;\
    wget -c http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz ;\
    tar xf ruby-2.1.3.tar.gz ;\
    cd ruby-2.1.3 ;\
    ./configure ;\
    make ;\
    make install ;\
    make clean

RUN gem install bundler therubyracer

RUN apt-get install -y postgresql postgresql-client postgresql-contrib libpq-dev 

USER postgres

RUN service postgresql start &&\
    psql --command "CREATE USER root WITH SUPERUSER PASSWORD '';" &&\
    createdb -O root asciinema_production ;\
    createdb -O root asciinema_development ;\
    service postgresql stop

USER root

RUN cd /opt ;\
    git clone git://github.com/sickill/asciinema.org.git ;\
    cd asciinema.org ;\
    apt-get install -y libxslt-dev libxml2-dev nodejs ;\
    service postgresql start ;\
    ./script/setup ;\
    RAILS_ENV='production' bundle exec rake db:setup ;\
    service postgresql stop 

RUN apt-get install -y redis-server nginx

ADD startup.sh /startup.sh

CMD /startup.sh

