# Trunk

## A message to Russian 🇷🇺 people

If you currently live in Russia, please read [this message][link:to-russia].

[![Stand With Ukraine][banner:support-ukraine]][link:support-ukraine]
[![Stand With Ukraine][badge:support-ukraine]][link:support-ukraine]
[![Software License][badge:license]][link:license]

## Description

Trunk is a small collection of provisions to be used in a Dockerfile that simplifies creating Ubuntu-based containers for PHP applications.

## Usage

```Dockerfile
FROM ubuntu:22.04

COPY --from=spidermane/trunk * /trunk

RUN /trunk/provisions/php --version 8.1 --bundle web --stack swoole --debug true

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
