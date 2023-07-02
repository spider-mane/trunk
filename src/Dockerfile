FROM scratch

LABEL maintainer="Chris Williams"

COPY --from=php:fpm /usr/local/etc/php-fpm.d/docker.conf /trunk/configurations/php/etc/fpm/pool.d/aa-docker.conf
COPY --from=php:fpm /usr/local/etc/php-fpm.d/zz-docker.conf /trunk/configurations/php/etc/fpm/pool.d/zz-docker.conf

COPY inc /trunk
