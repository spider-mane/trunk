FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

ENV HOST_UID=8964
ENV HOST_GID=1561

RUN mkdir /entrypoint.d && \
  echo "echo \"entrypoint script loaded!\"" > /entrypoint.d/test.sh

RUN /trunk/setups/entrypoint
# RUN /trunk/setups/entrypoint web

ENTRYPOINT [ "docker-entrypoint" ]
