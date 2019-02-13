#!/usr/bin/env bash

set -eux

RUBY_VERSION=2.5.3

# ------------------------------------------------------------------------------
# ruby 
# ------------------------------------------------------------------------------

# rbenv depend and install
cd $HOME
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv 
echo 'export RBENV_ROOT="$HOME/.rbenv"' >> $HOME/.bash_profile
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> $HOME/.bash_profile
echo 'eval "$(rbenv init -)"' >> $HOME/.bash_profile
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

# ruby
. $HOME/.bash_profile && CONFIGURE_OPTS="--disable-install-rdoc" rbenv install -v $RUBY_VERSION
. $HOME/.bash_profile && rbenv rehash
. $HOME/.bash_profile && rbenv global $RUBY_VERSION
. $HOME/.bash_profile && gem install bundler
. $HOME/.bash_profile && gem update --system 
. $HOME/.bash_profile && gem update bundler

