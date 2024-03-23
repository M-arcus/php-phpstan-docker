FROM ghcr.io/m-arcus/php-phpstan:base

ARG PHP_PHPSTAN_VERSION=1.10.63

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/phpstan/phpstan" \
      org.opencontainers.image.documentation="https://github.com/phpstan/phpstan/blob/1.11.x/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-phpstan-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHPStan"

RUN curl -sS https://getcomposer.org/installer | php -- --filename=composer.php && \
    chmod +x composer.php && \
    echo "{}"  > composer.json && php composer.php config -n allow-plugins.phpstan/extension-installer true && \
    php composer.php req -n -o phpstan/extension-installer phpstan/phpstan:${PHP_PHPSTAN_VERSION} phpstan/phpstan-phpunit phpstan/phpstan-symfony symplify/phpstan-rules:^11 && \
    rm -f composer.php composer.json composer.lock

ENTRYPOINT ["/usr/bin/php", "/vendor/bin/phpstan"]
