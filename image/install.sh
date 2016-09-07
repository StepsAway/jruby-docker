#!/bin/bash
set -e
source /rd_build/buildconfig
set -x

/rd_build/ruby_prep.sh
/rd_build/install_java.sh

if [[ "$jruby914" = 1 ]]; then /rd_build/jruby9.1.4.sh; fi
if [[ "$jruby1726" = 1 ]]; then /rd_build/jruby1.7.26.sh; fi

/rd_build/ruby_finalize.sh
/rd_build/cleanup.sh
