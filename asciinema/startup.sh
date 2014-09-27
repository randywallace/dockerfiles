#!/bin/bash

service postgresql start
service redis-server start

_rails_env='development'

cd /opt/asciinema.org

# RAILS_ENV=$_rails_env bundle exec rake assets:precompile

( RAILS_ENV=$_rails_env bundle exec sidekiq ) &
bundle exec rails server -e $_rails_env
