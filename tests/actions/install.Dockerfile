FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

COPY --from=trunktest.trunk * /trunk

RUN /trunk/actions/install bat php wget zip