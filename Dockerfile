FROM ghcr.io/m-arcus/php-cs-fixer:base

ARG PHP_CS_FIXER_VERSION=3.50.0

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/PHP-CS-Fixer/PHP-CS-Fixer" \
      org.opencontainers.image.documentation="https://cs.symfony.com" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-cs-fixer-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHP-CS-Fixer"

ADD https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v${PHP_CS_FIXER_VERSION}/php-cs-fixer.phar /php-cs-fixer.phar

ENTRYPOINT ["/usr/bin/php", "/php-cs-fixer.phar", "fix"]