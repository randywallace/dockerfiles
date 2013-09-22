########
#
# Dockerfile which sets up the latest stable MySQL 5.5.33 installation
#
########

FROM ubuntu:12.04

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get upgrade -y && apt-get install -y libaio1
ADD http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.33-linux2.6-x86_64.tar.gz/from/http://cdn.mysql.com/ /opt/mysql.tar.gz
RUN cd /opt && tar xvvf mysql.tar.gz && ln -s /opt/mysql-5.5.33-linux2.6-x86_64 /opt/mysql
RUN cd /opt/mysql/bin && for f in mysql mysqld_safe mysqld mysqladmin; do update-alternatives --install "/usr/bin/${f}" "${f}" "/opt/mysql/bin/${f}" 1; done
RUN groupadd mysql && useradd -r mysql -g mysql

ADD my-small.cfg /etc/my.cnf
ADD secure_install.sh /secure_install.sh
ADD mysql.server /mysql.server
RUN chmod a+x /mysql.server /secure_install.sh

RUN cd /opt/mysql && ./scripts/mysql_install_db && chown -R mysql:mysql ./* 
RUN cd /opt/mysql && (./bin/mysqld_safe ) & /secure_install.sh && /opt/mysql/bin/mysqladmin -u root -p'' shutdown

ENTRYPOINT ["/mysql.server", "start"]
EXPOSE 3306:3306
