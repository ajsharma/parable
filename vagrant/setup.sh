#!/bin/sh

####
# This script can be used to setup development (vagrant) environments
####

###
# Set correct locale
###
echo "Setting locale"
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

###
# Set the time zone
###
echo "Setting timezone to UTC"
echo "Etc/UTC" | sudo tee /etc/timezone
dpkg-reconfigure --frontend noninteractive tzdata

###
# Update apt-get
###
echo "Updating apt-get"
apt-get -qy update

echo "Installing libraries from apt-get"
apt-get -qy install curl build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev git-core libpq-dev libqt4-dev

###
# Install latest git
###
echo "Installing/updating git"
apt-get -qy install python-software-properties
add-apt-repository ppa:git-core/ppa
apt-get -qy update
apt-get -qy install git

###
# Install basic ruby for chef
# Releases can be found at http://ftp.ruby-lang.org/pub/ruby/2.0/
###
RUBY_RELEASE=ruby-2.0.0-p481
echo "Installing ${RUBY_RELEASE} for chef"

cd /tmp
wget http://ftp.ruby-lang.org/pub/ruby/2.0/${RUBY_RELEASE}.tar.gz
tar -xvzf ${RUBY_RELEASE}.tar.gz
cd ${RUBY_RELEASE}/
./configure --prefix=/usr/local
make
make install

###
# Install chef-solo
###
echo "Installing chef"
cd /vagrant
yes | gem install chef --version 11.16.4 --no-rdoc --no-ri --conservative --verbose

###
# Install librarian
###
echo "Installing librarian"
cd /vagrant
yes | gem install librarian-chef --version 0.0.4 --no-rdoc --no-ri --conservative --verbose
# chef is now installed as `chef-solo`

###
# Download cookbooks for chef
###
echo "Installing cookbooks"
cd /vagrant
librarian-chef install


echo "setup.sh complete"
