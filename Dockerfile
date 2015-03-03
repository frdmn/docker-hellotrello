# Base image
FROM ubuntu:13.10
MAINTAINER Jonas Friedmann <j@frd.mn>

# Install dependencies.
RUN apt-get update
RUN apt-get install -y curl git build-essential ruby1.9.3
RUN gem install rubygems-update --no-ri --no-rdoc
RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc

# Clone hellotrello from git
RUN rm -rf /tmp/hellotrello; true
RUN git clone https://github.com/frdmn/hellotrello.git /tmp/hellotrello
WORKDIR /tmp/hellotrello
# Install hellotrello
RUN bundle install

# Make sure our configuration is used
ADD opt/config.yml /tmp/
RUN cp /tmp/config.yml /tmp/hellotrello/config.yml

# Start bot
CMD ruby hellotrello.rb
