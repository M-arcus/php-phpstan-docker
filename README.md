# Small PHP-Mess-Detector Docker image

This image uses Wolfi-OS to create a very small PHPMD Docker image and still glibc, to be used in CI/CD pipelines.

## Usage

```bash
# or alternative use ghcr.io/m-arcus/php-mess-detector:latest
docker run --rm -v (pwd):(pwd) -w (pwd) marcusmu/php-mess-detector:latest /path/to/source text codesize
```

If you don't want to pass the as arguments, you can create your regular `phpmd.xml` (and `phpmd.baseline.xml` and `.phpmd.result-cache.php` (`--cache`)) file and PHP Mess Detector will pick it up as usual.
