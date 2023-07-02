FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

RUN /trunk/setups/healthcheck

RUN mkdir /healthcheck.d && \
  echo "echo \"healthcheck loaded!\"" > /healthcheck.d/dummy-healthcheck.sh
