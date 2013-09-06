########
#
# Dockerfile which sets up a ruby-1.9.3-p448 installation (this is the latest patch)
#
# Also installs facter 1.7.2
#
# Requires an image with ruby 1.8.7 or ruby 1.9.3
#
########

FROM ruby-1.9.3

MAINTAINER Randy D. Wallace Jr. <randy@randywallace.com>

RUN apt-get update && apt-get install -y lsb-release
ADD https://github.com/puppetlabs/facter/archive/1.7.2.tar.gz /opt/facter-1.7.2.tar.gz
ADD https://github.com/puppetlabs/puppet/archive/3.2.4.tar.gz /opt/puppet-3.2.4.tar.gz
RUN cd /opt && tar xvvf facter-1.7.2.tar.gz
RUN cd /opt && tar xvvf puppet-3.2.4.tar.gz
RUN cd /opt/facter-1.7.2 && ./install.rb
RUN cd /opt/puppet-3.2.4 && ./install.rb
RUN puppet resource group puppet ensure=present && puppet resource user puppet ensure=present gid=puppet shell='/sbin/nologin'

