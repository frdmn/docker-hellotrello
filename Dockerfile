FROM ubuntu:13.10
MAINTAINER j@frd.mn

# Install dependencies.
RUN apt-get update
RUN apt-get install -y curl git build-essential ruby1.9.3
RUN gem install rubygems-update --no-ri --no-rdoc
RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc

RUN rm -rf /tmp/hellotrello; true
RUN git clone https://github.com/frdmn/docker-slack-irc-plugin.git /tmp/hellotrello
WORKDIR /tmp/hellotrello
RUN npm install

ADD opt/config.yml /tmp/
RUN cp /tmp/config.yml /tmp/hellotrello/config.yml

RUN ruby hellotrello.rb
