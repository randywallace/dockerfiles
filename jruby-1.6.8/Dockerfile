########
#
# Dockerfile which sets up a working jruby-1.6.8 installation
#
# Note: this Dockerfile depends on a working java installation
#
########

# This image matches the oracle-java-6 Dockerfile
FROM oracle-java-6

ADD http://jruby.org.s3.amazonaws.com/downloads/1.6.8/jruby-bin-1.6.8.tar.gz /opt/jruby.tar.gz
RUN cd /opt && tar xvvf jruby.tar.gz && rm jruby.tar.gz
RUN update-alternatives --install "/usr/bin/ruby" "ruby" "/opt/jruby-1.6.8/bin/jruby" 1
RUN cd /opt/jruby-1.6.8/bin/ && for f in gem irb jgem jirb jirb_swing jruby jrubyc rake rdoc ri; do update-alternatives --install "/usr/bin/${f}" "${f}" "/opt/jruby-1.6.8/bin/${f}" 1; done 
