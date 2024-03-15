# Small Fink Docker image

This image uses Wolfi-OS to create a very small [Fink](https://github.com/dantleech/fink) Docker image and still glibc, to be used in CI/CD pipelines.

## Usage

```bash
# or alternative use ghcr.io/m-arcus/php-fink:latest
docker run --rm -v $(pwd):$(pwd) -w $(pwd) marcusmu/php-fink:latest https://my.website.com/ --output=result.json --exclude-url=Account --insecure
```

If you want to scan for broken links in a website, you can use the following command:

```bash
cat result.json | jq -c '. | select(.status!=200) | {status: .status, url: .url, referrer: .referrer}' | jq
```
