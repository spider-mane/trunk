FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV LANG="ja_JP.UTF-8"

RUN /trunk/setups/language
