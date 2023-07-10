#!/usr/bin/env bash

if [ -n "$TRUNK_USER" ]; then
  cd "$(dirname $(dirname $(realpath $0)))"

  phpversion="$(php -r 'echo PHP_MAJOR_VERSION.".".PHP_MINOR_VERSION;')"

  conf="zzz-user.conf"
  template="templates/php/etc/fpm/${conf}.template"
  file="/etc/php/${phpversion}/fpm/pool.d/${conf}"

  envsubst '$TRUNK_USER' <"$template" >"$file"
fi
