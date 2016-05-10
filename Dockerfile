FROM buildpack-deps:trusty
MAINTAINER Alexander Skiba <alexander.skiba@icg.tugraz.at>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    isc-dhcp-server \
    postfix \
    puppet \
    ruby-dev \
    rsync \
    shorewall \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install --no-rdoc --no-ri \
    puppet-lint \
    rails-erb-lint
