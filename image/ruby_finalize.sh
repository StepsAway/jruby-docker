#!/bin/bash
set -e
source /rd_build/buildconfig
set -x

## This script is to be run after ruby2.2.sh, ruby2.3.sh.
## The Rails asset compiler requires a Javascript runtime.
apt-get update
$minimal_apt_get_install nodejs
if [[ ! -e /usr/bin/node ]]; then
	ln -s /usr/bin/nodejs /usr/bin/node
fi

ln -s /usr/local/jruby/bin/jruby /usr/bin/ruby
