# Small PHPStan Docker image

This image uses Wolfi-OS to create a very small [PHPStan](https://github.com/phpstan/phpstan) Docker image and still glibc, to be used in CI/CD pipelines.

## Usage

```bash
# or alternative use ghcr.io/m-arcus/php-phpstan:latest
docker run --rm -v $(pwd):$(pwd) -w $(pwd) marcusmu/php-phpstan:latest analyze src/
```
