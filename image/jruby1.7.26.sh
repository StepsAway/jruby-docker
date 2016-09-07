#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

JRUBY_VERSION=1.7.26
RUBY_DOWNLOAD_SHA256=8d6ea85ce1bce219ee0004b345cc7557edb6a559cbc8d6d4e9a988080bf3bc2c
RUBYGEMS_VERSION=2.6.6
BUNDLER_VERSION=1.11.2

ruby_install
