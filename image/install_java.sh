#!/bin/bash
set -e
source /rd_build/buildconfig
set -x

# Install java-8-oracle and key packages
add-apt-repository -y ppa:webupd8team/java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get update
$minimal_apt_get_install oracle-java8-installer ca-certificates-java
rm -rf /var/lib/apt/lists/* /var/cache/oracle-jdk8-installer/*.tar.gz /usr/lib/jvm/java-8-oracle/src.zip /usr/lib/jvm/java-8-oracle/javafx-src.zip \
		/usr/lib/jvm/java-8-oracle/jre/lib/security/cacerts
ln -s /etc/ssl/certs/java/cacerts /usr/lib/jvm/java-8-oracle/jre/lib/security/cacerts
update-ca-certificates
java -version
