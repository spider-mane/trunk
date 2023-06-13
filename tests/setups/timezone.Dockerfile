FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ="America/New_York"

RUN /trunk/setups/timezone
