#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
# bundle exec rake db:migrate
DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rake db:migrate:reset  #追記
# bundle install
# yarn install
# yarn build # jsファイルをesbuildでバンドルしているため
# bundle exec rails assets:precompile # cssはsprocketsを使っているため
# bundle exec rails db:migrate:status # migrateはridgepoleを使っているため（標準のmigrateを使うならbundle exec rails db:migrateで良いかと思います）
