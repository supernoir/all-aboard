FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN gem install bundler -v 2.0.1
RUN bundle install

ADD . $APP_HOME

EXPOSE 8080

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "8080"]