# 概要

Campus Anywhereは高校生向けの大学情報共有サイトです。  
キャンパスの情報を投稿したり、気になるユーザーをフォローすることで、入学前から繋がりを作ることができます。

## 使用した技術

Ruby 2.6.9  
Rails 6.1.4.6  
Rspec 3.11  
jquery 3.4.1  
PostgreSQL 14.2  
Nginx(Web Server)  
Puma(Application Server)  
docker 20.10.14  
docker-compose 1.29.2  
Capistrano  
AWS EC2 (Amazon Linux2)/RDS(Postgresql)/S3/VPC/IAM  

## 機能一覧

ユーザー登録機能  
レビュー投稿機能  
ユーザー情報編集機能  
ユーザー削除機能  
いいね機能  
フォローフォロバ機能  
ページネーション機能  
DM送信機能  
大学名・ユーザー名キーワード検索機能

## 工夫した点

Rspec・Rubocopによるテスト・バグの検知  
follow・unfollowボタンに非同期通信を使用ユーザーの負担軽減