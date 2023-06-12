FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=trunktest.trunk * /trunk

RUN /trunk/provisions/php --version 8.1 --bundle web --stack swoole,gmagick --dev true
