FROM ubuntu:14.04

MAINTAINER Jon Appelberg

# testdroid-ssa-client requirements
RUN apt-get update
RUN apt-get install -y ruby
RUN apt-get install -y ffmpeg2theora
RUN apt-get install -y libav-tools
RUN gem install sinatra
