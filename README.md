# Docker base images for JRuby

JRuby-docker is a set of is a set of [Docker](https://www.docker.com) images meant to serve as good bases for **JRuby**. It uses [stepsaway/baseimage-docker](https://hub.docker.com/r/stepsaway/baseimage/) as it base image and builds & installs JRuby from source.

## Images

Each major version of JRuby has its own image and the patch level changes are included in the tag.

## Tags

The tags for JRuby-docker include the patch level for the major JRuby version, followed by the version of stepsaway/baseimage-docker which JRuby-docker uses for its base image. For example, JRuby 9.4.1.0 on stepsaway/baseimage:1.0.0 would be: _stepsaway/baseimage-jruby91:4-1.0.0_
