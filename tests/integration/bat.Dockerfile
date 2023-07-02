FROM ubuntu:22.04 as test

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

ENV LANG="en_US.UTF-8"

RUN /trunk/setups/language
RUN /trunk/setups/bash
RUN /trunk/provisions/zsh

RUN /trunk/provisions/bat
