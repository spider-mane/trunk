FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR "$HOME"

COPY --from=trunktest.trunk * /trunk

RUN /trunk/provisions/node --version 16
