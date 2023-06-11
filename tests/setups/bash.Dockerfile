FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=trunktest.trunk * /trunk

ENV APP=/trunk

RUN /trunk/setups/bash
