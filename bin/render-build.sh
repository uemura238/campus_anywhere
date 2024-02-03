#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
bundle exec rake assets:precompile # cssはsprocketsを使っているため
bundle exec rake db:migrate:reset
bundle exec rails db:seed
