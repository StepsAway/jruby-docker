FROM stepsaway/baseimage:##TAG##
MAINTAINER StepsAway <devgru@stepsaway.com>

COPY . /rd_build
RUN /rd_build/install.sh
ENV PATH /usr/local/jruby/bin:$PATH

CMD ["/sbin/my_init"]
