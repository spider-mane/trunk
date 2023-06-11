FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=trunktest.trunk * /trunk

ENV LANG=ja_JP.UTF-8

RUN /trunk/setups/language
