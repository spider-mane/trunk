FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
# ENV PHP_VERSION="7.3"

RUN /trunk/provisions/supervisor --php-version 7.4
# RUN /trunk/provisions/supervisor
