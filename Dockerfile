FROM ruby:2.7

# Install additional packages.
RUN apt update -qq
RUN apt install -y postgresql-client

# Prepare working directory.
WORKDIR /chatapp
COPY ./chatapp /chatapp
RUN gem install bundler
RUN bundle install

# Configure endpoint.
#COPY ./.docker/ror/entrypoint.sh /usr/bin/
#RUN chmod +x /usr/bin/entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start app server.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]