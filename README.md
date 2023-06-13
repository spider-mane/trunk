# Trunk

## A message to Russian 🇷🇺 people

If you currently live in Russia, please read [this message][link:to-russia].

[![Stand With Ukraine][banner:support-ukraine]][link:support-ukraine]
[![Stand With Ukraine][badge:support-ukraine]][link:support-ukraine]
[![Software License][badge:license]][link:license]

## Description

Trunk is a collection of provisioning scripts that simplifies creating images for running PHP applications.

## Usage

### Getting Started

#### For Web Applications

The example below will create a simple image for hosting a PHP web application.

```Dockerfile
# Start with an image running Ubuntu
FROM ubuntu:22.04

# Copy Trunk files into image
COPY --from=spidermane/trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1

# Define "APP" environment variable that stores path to application
ENV APP=/var/www/html

WORKDIR "$APP"

# Run desired provisioning scripts
ARG TZ="UTC"
ENV TZ="$TZ"
RUN /trunk/setups/timezone

RUN /trunk/actions/install mysql-client sqlite3

ARG DEV=true
RUN /trunk/provisions/php --version 8.1 --bundle web --stack swoole,imagick --dev "$DEV"

# Select and set entrypoint
RUN /trunk/setups/entrypoint web
RUN /trunk/provisions/supervisor --php-version 8.1 # Ensure any dependencies are provisioned
ENTRYPOINT [ "docker-entrypoint" ]

EXPOSE 9000

# Remove temporary installation files including trunk directory copied previously
RUN /trunk/actions/cleanup
```

Containers created using the image defined above work via php-fpm. With this setup you'll still need a separate container running a properly configured web server such as NGINX. Fortunately, Trunk helps to simplify this process as well.

```Dockerfile
FROM nginx:latest

COPY --from=spidermane/trunk * /trunk

# In this scenario, environment variables are used to create a configuration file
ENV SERVER_NAME="localhost"
ENV SERVER_PORT=80
ENV APP_NAME="app"
ENV APP_PORT=9000
ENV WEB_ROOT=/var/www/html/public

RUN /trunk/extras/nginx

RUN /trunk/actions/cleanup
```

#### For Libraries

If all you need is a container to develop and test libraries, the setup you'll need is much simpler.

```Dockerfile
FROM ubuntu:22.04

COPY --from=spidermane/trunk * /trunk

ENV DEBIAN_FRONTEND=noninteractive
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP=/app

WORKDIR "$APP"

ARG TZ="UTC"
ENV TZ="$TZ"
RUN /trunk/setups/timezone

RUN /trunk/provisions/php --version 8.0 --dev true

RUN /trunk/setups/entrypoint
ENTRYPOINT [ "docker-entrypoint" ]

RUN /trunk/actions/cleanup
```

## Change log

Please see [CHANGELOG][link:changelog] for more information on what has changed recently.

## Contributing

Please see [CONTRIBUTING][link:contributing] and [CODE_OF_CONDUCT][link:code-of-conduct] for details.

## Security

If you discover any security related issues, please email :author_email instead of using the issue tracker.

## Credits

- [Chris Williams][link:author]
- [All Contributors][link:contributors]

## License

The MIT License (MIT). Please see [License File][link:license] for more information.

<!-- Links -->

[link:author]: https://github.com/spider-mane
[link:changelog]: CHANGELOG.md
[link:code-of-conduct]: CODE_OF_CONDUCT.md
[link:contributing]: CONTRIBUTING.md
[link:contributors]: ../../contributors
[link:license]: LICENSE.md

<!-- Badges -->

[badge:license]: https://img.shields.io/badge/license-MIT-brightgreen.svg

<!-- Support Ukraine -->

[badge:support-ukraine]: https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg
[banner:support-ukraine]: https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg
[link:support-ukraine]: https://stand-with-ukraine.pp.ua
[link:to-russia]: https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/ToRussianPeople.md
