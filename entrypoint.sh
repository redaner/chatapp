#!/bin/bash
set -e
bin/rails db:create
bin/rails db:migrate
bin/rails db:environment:set RAILS_ENV=test
rspec
bin/rails db:environment:set RAILS_ENV=development
exec "$@"
