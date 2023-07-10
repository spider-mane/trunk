FROM ubuntu:22.04 as test

COPY --from=trunktest.trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive

# INTEGRATIONS

ENV TRUNK_USER=tuser

RUN /trunk/bundles/shell

# SUT

# RUN /trunk/provisions/php
RUN /trunk/provisions/php --stack fpm

# FIXTURES

ENV APP=/app
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN mkdir -p "$APP" && \
  composer init -d "$APP" -n --name trunk/trunktest

RUN composer_bin="$(composer -d "$APP" config bin-dir --absolute 2>/dev/null)" && \
  mkdir -p "$composer_bin" && \
  script="${composer_bin}/localcomposerscript" && \
  echo "echo \"local composer script loaded!\"" > "$script" && \
  chmod +x "$script"

RUN composer_bin="$(composer global config bin-dir --absolute 2>/dev/null)" && \
  mkdir -p "$composer_bin" && \
  script="${composer_bin}/globalcomposerscript" && \
  echo "echo \"global composer script loaded!\"" > "$script" && \
  chmod +x "$script"

# CLEANUP

RUN /trunk/actions/cleanup

# alias cleanup="cp -r /trunk /trunk2 && /trunk/actions/cleanup && mv /trunk2 /trunk"
