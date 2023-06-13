FROM ubuntu:22.04

COPY --from=trunktest.trunk * /trunk
