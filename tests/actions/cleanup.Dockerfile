FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /trunk/cleanup.d && \
  echo "touch /cleanup-script-added" > /trunk/cleanup.d/cleanup-test.sh

RUN /trunk/actions/cleanup
