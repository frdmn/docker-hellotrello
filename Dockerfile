# Base image
FROM dockerfile/ruby
MAINTAINER Jonas Friedmann <j@frd.mn>

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
