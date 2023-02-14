FROM ruby:3.0.5-bullseye

LABEL project="R6 validations"

RUN apt-get update -qq \
  && apt-get install -qq libpq-dev curl \
  && apt-get clean -qq \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install
ADD . /app

CMD rm -rf tmp/pids/server.pid && rails server -b 0.0.0.0