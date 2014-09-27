#!/bin/bash

service postgresql start
service redis-server start

ENV=${ENV:-production}
export RACK_ENV=$ENV
export RAILS_ENV=$ENV
UNICORN_SOCKET='/tmp/unicorn.sock'
PORT=${PORT:-80}
UNICORN_WORKERS=1
UNICORN_TIMEOUT=30
FQDN="${FQDN}"

cd /opt/asciinema.org

( bundle exec sidekiq ) &

if [[ "$RAILS_ENV" == "production" ]]; then 
  cat <<EOF > config/unicorn.rb
listen "${UNICORN_SOCKET}"
worker_processes ${UNICORN_WORKERS}
timeout ${UNICORN_TIMEOUT}
EOF
  cat <<EOF > /etc/nginx/sites-enabled/asciinema.org.conf
upstream unicorn {
  server unix:${UNICORN_SOCKET} fail_timeout=0;
}

#server {
#  server_name www.phindee.com;
#  return 301 \$scheme://phindee.com\$request_uri;
#}

server {
  listen ${PORT} default deferred;
  #server_name phindee.com;
  root /opt/asciinema.org/public;

 location ^~ /assets/ {
    gzip_static on;
    expires max;
    add_header Cache-Control public;
  }

  try_files \$uri/index.html \$uri @unicorn;
  location @unicorn {
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header Host \$http_host;
    proxy_redirect off;
    proxy_pass http://unicorn;
  }

  error_page 500 502 503 504 /500.html;
  error_page 404 /404.html;
  error_page 422 /422.html;
  keepalive_timeout 10;
}
EOF
  rm /etc/nginx/sites-enabled/default
  service nginx configtest
  service nginx start
  bundle exec rake assets:precompile 
  bundle exec unicorn_rails -c config/unicorn.rb
else
  bundle exec rails s
fi

