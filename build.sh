#!/usr/bin/env bash

set -eo pipefail

version=$1
arch=$2
params=$3

if [ -z "$version" ]; then
  echo "Usage: $0 <version> <arch>"
  exit 1
fi

if [ -z "$arch" ]; then
  echo "Usage: $0 <version> <arch>"
  exit 1
fi

echo "Building version $version"

rm -rf rootfs
mkdir rootfs

if [[ ! -d db ]]; then
  git clone -b ubuntu-23.10-php https://github.com/shyim/chisel-releases.git db
fi

chisel cut --arch=$ARCH --release ./db --root rootfs/ php8.2-cli_base php8.2-common_tokenizer php8.2-common_phar php8.2-mbstring_all php8.2-xml_dom

if [[ -e ".cache/php-cs-fixer-${version}.phar" ]]; then
    echo "Using cached version"
else
    mkdir -p .cache || true
    curl -q -L -o ".cache/php-cs-fixer-${version}.phar" "https://github.com/PHP-CS-Fixer/PHP-CS-Fixer/releases/download/v${version}/php-cs-fixer.phar"
fi

cp ".cache/php-cs-fixer-${version}.phar" rootfs/php-cs-fixer.phar

docker build --platform "linux/${arch}" -t "shyim/php-cs-fixer:${version}-${arch}" .

if [[ "$params" == "--push" ]]; then
  docker push "shyim/php-cs-fixer:${version}-${arch}"
fi
