FROM ruby:2.6.5

RUN apt-get update && \
    apt-get install -y mariadb-client nodejs vim --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir /reading_memo

WORKDIR /reading_memo

ADD Gemfile /reading_memo/Gemfile
ADD Gemfile.lock /reading_memo/Gemfile.lock

RUN gem install bundler
RUN bundle install

ADD . /reading_memo