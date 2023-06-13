FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN /trunk/provisions/php --version 8.1 --bundle web --stack swoole,gmagick --dev true
# RUN /trunk/provisions/php
