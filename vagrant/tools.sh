#!/bin/sh

####
# This script can be used to install tools and utilities
####

###
# Install binaries with apt-get
###

echo "Installing tools and utilities..."
apt-get -qy install ack-grep htop screen tig tmux vim

# See http://beyondgrep.com/install/ for this
echo "Alias ack-grep to ack"
dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep

echo "Setting Vim as default Git editor..."
git config --global core.editor "vim"

###
# Install node packages with npm
###

echo "Installing node packages..."
npm install --global --quiet --yes coffeelint jscpd jsonlint
