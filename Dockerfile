FROM ruby:3.1.0

RUN apt update -qq
RUN apt install -y postgresql-client

RUN mkdir /chatapp
WORKDIR /chatapp
COPY ./* /chatapp/
RUN gem install bundler
RUN bundle config set force_ruby_platform true
RUN bundle install

EXPOSE 3000
