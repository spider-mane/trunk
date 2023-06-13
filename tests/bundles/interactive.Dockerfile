FROM ubuntu:22.04

COPY --from=trunktest * /trunk

ENV DEBIAN_FRONTEND=noninteractive
