FROM ruby:3.1.4
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /campus_anywhere

ADD Gemfile /campus_anywhere/Gemfile
ADD Gemfile.lock /campus_anywhere/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /campus_anywhere