#!/usr/bin/env bash

set -eux

# Sample custom configuration script - add your own commands here
# to add some additional commands for your environment
#
# For example:
# yum install -y curl wget git tmux firefox xvfb
RUBY_VERSION=2.5.3

sudo apt-get update
sudo apt-get install -y curl wget git

# ------------------------------------------------------------------------------
# ruby 
# ------------------------------------------------------------------------------

# rbenv depend and install
sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev 

# node
sudo curl -sL https://deb.nodesource.com/setup_10.x | bash -
sudo apt-get install -y nodejs
sudo npm install -g yarn@1.9.2

#------------------------------------------------------------------------------
# depending packages   
#------------------------------------------------------------------------------
# elasticsearch
sudo cd /tmp && curl -LO https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.4.1/elasticsearch-2.4.1.deb && dpkg -i elasticsearch-2.4.1.deb &&  rm elasticsearch-2.4.1.deb && ln -s /etc/elasticsearch/ /usr/share/elasticsearch/config

# java
sudo apt-get install openjdk-8-jdk -y
# sudo /usr/share/elasticsearch/bin/elasticsearch -Des.insecure.allow.root=true

# heroku cli
curl https://cli-assets.heroku.com/install-ubuntu.sh | sh
# Redis
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
sudo apt-get install -y build-essential tcl
sudo cd /tmp && curl -O http://download.redis.io/redis-stable.tar.gz && tar xzvf redis-stable.tar.gz && cd redis-stable && make && make install

# Sqlite
sudo apt-get install -y sqlite3 libsqlite3-dev
# Postgres
sudo apt-get install -y postgresql postgresql-contrib libpq-dev
# Imagemagick
sudo apt-get install -y imagemagick
sudo apt-get install -y libmagickcore-dev libmagickwand-dev
# libcurl
sudo apt-get install -y libcurl3 libcurl3-gnutls # libcurl4-openssl-dev
# Japanese font
sudo  apt-get -y install language-pack-ja
sudo  apt-get -y install libpq-dev

#-------------------------------------------------------------------------------
# Clean up APT when done.
#-------------------------------------------------------------------------------
sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
