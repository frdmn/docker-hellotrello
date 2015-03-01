FROM ubuntu:12.10
MAINTAINER brian@morearty.org

# Install dependencies.
RUN apt-get update
RUN apt-get install -y curl git build-essential ruby1.9.3
RUN gem install rubygems-update --no-ri --no-rdoc
RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc

ADD opt/config.yml /tmp/

RUN rm -rf /tmp/hellotrello; true
RUN git clone https://github.com/frdmn/docker-slack-irc-plugin.git /tmp/hellotrello
WORKDIR /tmp/hellotrello
RUN npm install
RUN cp /tmp/config.yml /tmp/hellotrello/config.yml

RUN ruby hellotrello.rb
