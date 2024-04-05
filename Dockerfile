FROM cgr.dev/chainguard/php:latest-dev AS builder

ARG PHP_PHPSTAN_VERSION=1.10.63

COPY composer.json composer.lock ./

RUN cd /app/ && \
    curl -sS https://getcomposer.org/installer | php -- --filename=composer.php && \
    chmod +x /app/composer.php && \
    php /app/composer.php req -n -o phpstan/phpstan:${PHP_PHPSTAN_VERSION} --ignore-platform-reqs && \
    chmod -Rf +rwx /app/vendor/ && \
    rm -f /app/composer.php /app/composer.json /app/composer.lock

FROM cgr.dev/chainguard/php:latest

RUN apk add --no-cache php-8.2-xml php-8.2-simplexml

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/phpstan/phpstan" \
      org.opencontainers.image.documentation="https://github.com/phpstan/phpstan/blob/1.11.x/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-phpstan-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHPStan"

COPY --from=builder /app /app

ENTRYPOINT ["/usr/bin/php", "/app/vendor/bin/phpstan"]
