FROM ubuntu:22.04 as test

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

RUN /trunk/bundles/shell
RUN /trunk/actions/install git

# INTEGRATIONS

RUN /trunk/setups/entrypoint
ENTRYPOINT [ "docker-entrypoint" ]

RUN /trunk/setups/healthcheck
HEALTHCHECK CMD [ "docker-healthcheck" ] --interval=2s --timeout=2s --start-period=1s --retries=3

# SUT

ENV TRUNK_USER=tuser

RUN /trunk/setups/user

RUN /trunk/actions/cleanup

# making sure files created in root on build extensions are copied
FROM test as test-2

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir /root/.cache
RUN mkdir /root/.trunktestdir
# RUN git clone https://github.com/composer/composer /root/files

RUN /trunk/actions/cleanup

# FIXTURES

ENV HOST_UID=9000
ENV HOST_GID=8000
