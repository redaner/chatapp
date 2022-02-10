FROM ruby:2.7.0

RUN apt update -qq
RUN apt install -y postgresql-client

RUN mkdir /chatapp
WORKDIR /chatapp
COPY ./* /chatapp/
RUN gem install bundler
RUN bundle install

EXPOSE 3000
