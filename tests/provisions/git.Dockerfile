FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV APP=/app

COPY --from=trunktest.trunk * /trunk

RUN /trunk/provisions/git --user "Oatgrazer Porter" --email "ogporter@example.com" --default-branch masta --install-gcm true

# create dummy repository to inspect delta output
RUN cd $HOME && \
  mkdir delta-test && \
  cd delta-test && \
  cp -r /trunk/provisions/. . && \
  git init && \
  git add . && \
  git commit -m 'initial commit' && \
  rm git && mv php git
