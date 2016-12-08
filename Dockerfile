FROM buildpack-deps:trusty
MAINTAINER Alexander Skiba <alexander.skiba@icg.tugraz.at>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://packages.elastic.co/logstash/2.3/debian stable main" >> "/etc/apt/sources.list.d/logstash.list" \
 && apt-key adv --keyserver keys.gnupg.net --recv-keys 46095ACC8548582C1A2699A9D27D666CD88E42B4 \
 && apt-get update && apt-get install -y \
    isc-dhcp-server \
    logstash \
    openjdk-7-jre-headless \
    postfix \
    puppet \
    ruby-dev \
    rsync \
    shorewall \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN gem install --no-rdoc --no-ri puppet-lint

# newer rails-erb-lint requires higher Ruby version
RUN gem install --no-rdoc --no-ri rails-erb-lint -v 1.1.6
