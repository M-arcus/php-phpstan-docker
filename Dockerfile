FROM ghcr.io/m-arcus/php-phpstan:base

ARG PHP_PHPSTAN_VERSION=1.10.63

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/phpstan/phpstan" \
      org.opencontainers.image.documentation="https://github.com/phpstan/phpstan/blob/1.11.x/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-phpstan-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHPStan"

COPY composer.json composer.lock ./

RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer.php && \
    chmod +x composer.php && \
    php composer.php req -n -o phpstan/phpstan:${PHP_PHPSTAN_VERSION} && \
    rm -f composer.php composer.json composer.lock

ENTRYPOINT ["/usr/bin/php", "/vendor/bin/phpstan"]
