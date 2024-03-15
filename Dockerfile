FROM ghcr.io/m-arcus/php-fink:base

ARG PHP_PHPMD_VERSION=0.10.3

LABEL org.opencontainers.image.authors="M-arcus" \
      org.opencontainers.image.url="https://github.com/dantleech/fink/" \
      org.opencontainers.image.documentation="https://github.com/dantleech/fink/blob/master/README.md" \
      org.opencontainers.image.source="https://github.com/M-arcus/php-fink-docker" \
      org.opencontainers.image.vendor="M-arcus" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="Fink"

ADD https://github.com/dantleech/fink/releases/download/${PHP_PHPMD_VERSION}/fink.phar /fink.phar

ENTRYPOINT ["/usr/bin/php", "/fink.phar"]
