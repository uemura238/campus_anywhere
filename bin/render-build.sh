#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
bundle exec rake db:migrate

# bundle install
# yarn install
# yarn build # jsファイルをesbuildでバンドルしているため
# bundle exec rails assets:precompile # cssはsprocketsを使っているため
# bundle exec rails db:migrate:status # migrateはridgepoleを使っているため（標準のmigrateを使うならbundle exec rails db:migrateで良いかと思います）
