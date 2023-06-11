FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=trunktest.trunk * /trunk

ENV TZ=America/New_York

RUN /trunk/setups/timezone
