########
#
# Dockerfile which sets up a working jruby-1.7.4 installation
#
# Note: this Dockerfile depends on install
#
#
#
########

FROM oracle-java-7

ADD http://jruby.org.s3.amazonaws.com/downloads/1.7.4/jruby-bin-1.7.4.tar.gz /opt/jruby.tar.gz
RUN cd /opt && tar xvvf jruby.tar.gz && rm jruby.tar.gz
RUN update-alternatives --install "/usr/bin/ruby" "ruby" "/opt/jruby-1.7.4/bin/jruby" 1
RUN cd /opt/jruby-1.7.4/bin/ && for f in gem irb jgem jirb jirb_swing jruby jrubyc rake rdoc ri; do update-alternatives --install "/usr/bin/${f}" "${f}" "/opt/jruby-1.7.4/bin/${f}" 1; done 
RUN gem install rdoc rdoc-data 
RUN ruby -rubygems -r'rdoc/data' -e 'RDoc::Data.run' -- --install