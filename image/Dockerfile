FROM stepsaway/baseimage:##TAG##
LABEL maintainer="StepsAway <infra-ops@stepsaway.com>"

COPY . /rd_build
RUN /rd_build/install.sh
ENV PATH /usr/local/jruby/bin:$PATH

CMD ["/sbin/my_init"]
