#!/bin/bash
# skip installing gem documentation
set -ex
mkdir -p /usr/local/etc \
	&& { \
		echo 'install: --no-document'; \
		echo 'update: --no-document'; \
	} >> /usr/local/etc/gemrc

packages='build-essential autoconf libxml2-dev libxslt1-dev imagemagick libmagickwand-dev libreadline6 libreadline6-dev libcurl4-openssl-dev zlib1g-dev'
