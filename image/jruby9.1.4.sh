#!/bin/bash
set -e
source /rd_build/buildconfig
source /rd_build/ruby_prep.sh
source /rd_build/ruby_install
set -x

JRUBY_VERSION=9.1.4.0
RUBY_DOWNLOAD_SHA256=cde189a22f6b93a439873e4130fc2c73f07554d4f9c415adef2dd8429626be67
RUBYGEMS_VERSION=2.6.6
BUNDLER_VERSION=1.11.2

ruby_install
