FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR "$HOME"

RUN /trunk/provisions/node --version 16
