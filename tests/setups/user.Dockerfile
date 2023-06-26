FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

RUN touch "${HOME}/.dummyfile"

RUN /trunk/setups/user
