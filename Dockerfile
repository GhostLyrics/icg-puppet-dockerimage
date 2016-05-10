FROM buildpack-deps:trusty
MAINTAINER Alexander Skiba <alexander.skiba@icg.tugraz.at>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    puppet \
    ruby-dev \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install --no-rdoc --no-ri \
    puppet-lint \
    rails-erb-lint
