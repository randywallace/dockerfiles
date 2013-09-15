########
#
# Dockerfile which sets up the latest TreeIO installation
#
# Uses MySQL Installation from Dockerfile in this repo
#
# Still a work in progress...
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" > /etc/apt/sources.list.d/universe.list
RUN echo "deb-src http://archive.ubuntu.com/ubuntu precise main" >> /etc/apt/sources.list
RUN apt-get update && apt-get upgrade -y && apt-get install -y python build-essential python-dev && apt-get build-dep -y python-lxml python-imaging && apt-get install -y git python-flup python-pip
RUN apt-get install -y nginx unzip mysql-client libmysqlclient-dev python-mysqldb

ADD https://github.com/treeio/treeio/archive/master.zip /opt/treeio.zip

RUN cd /opt && unzip treeio.zip && mv treeio-master treeio && rm -f treeio.zip && cd treeio && pip install -r requirements.pip
RUN mysql -u root -h 172.17.42.1 -e 'create database treeio' 
RUN cd /opt/treeio && echo '{"default": {"ENGINE": "django.db.backends.mysql", "NAME": "treeio", "HOST": "172.17.42.1", "USER": "root", "PASSWORD": "", "PORT": ""}}' > core/db/dbsettings.json
RUN cd /opt/treeio && python manage.py loaddata data.json

CMD ["python", "manage.py", "runserver", "0.0.0.0:80" ]
EXPOSE 80

