FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN /trunk/provisions/php

RUN /trunk/provisions/studio --path /localrepo
# RUN /trunk/provisions/studio
