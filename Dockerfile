FROM ruby:2.5.8-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs libsqlite3-dev git \
    && apt-get clean autoclean \
    && apt-get autoremove -y
RUN mkdir /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN gem install bundler -v 2.2.13
RUN bundle install
COPY . /app
CMD bundle exec rails s -p 3000 -b '0.0.0.0'
