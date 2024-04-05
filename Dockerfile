FROM chainguard/php:latest

ARG PHP_PHPSTAN_VERSION=1.10.63

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/phpstan/phpstan" \
      org.opencontainers.image.documentation="https://github.com/phpstan/phpstan/blob/1.11.x/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-phpstan-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHPStan"

COPY composer.bash composer.json composer.lock ./

RUN ./composer.bash

ENTRYPOINT ["/usr/bin/php", "/vendor/bin/phpstan"]
