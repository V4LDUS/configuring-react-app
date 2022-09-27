# ruby environment
FROM ruby:2.7.1-slim

# install all the required dependencies
RUN apt-get update && \
gem install sinatra && \
gem install sinatra-contrib && \
yes | apt install ruby-bundler

# working directory
WORKDIR /myapp

# copy all files
COPY . /myapp

RUN bundle install
#EXPOSE 4567/tcp

# startup command
CMD ["ruby", "backend.rb", "-o", "0.0.0.0"]