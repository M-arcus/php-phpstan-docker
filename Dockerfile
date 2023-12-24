FROM scratch
LABEL org.opencontainers.image.authors="shyim" \
      org.opencontainers.image.url="https://github.com/PHP-CS-Fixer/PHP-CS-Fixer" \
      org.opencontainers.image.documentation="https://cs.symfony.com" \
      org.opencontainers.image.source="https://github.com/shyim/php-cs-fixer-docker" \
      org.opencontainers.image.vendor="shyim" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.title="PHP-CS-Fixer"
COPY rootfs/ /
ENTRYPOINT ["/usr/bin/php", "/php-cs-fixer.phar", "fix"]