# Dockerized `agate` gemini server

This is a simple agate gemini server image, compiled for musl c in an `alpine:edge` base image.

Thanks to [mbrubeck/agate](https://github.com/mbrubeck/agate) for coding the server!

It's not made for multiple hosts or anything fancy, and it's hard set to English right now.

There is no need to create certs manually, agate will do it automatically and put them in `.certificates` for reuse.

## Docker Compose
```
---
version: "3"
services:
  agate:
    image: ja2ui0/agate
    container_name: gemini
    hostname: <fqdn>
    ports:
      - 1965:1965
    restart: unless-stopped
    volumes:
      - <your-content-dir>:/content
      - <your-certs-dir>:/.certificates
```
## Docker Run
```
docker run -d \
  --name gemini \
  --hostname <fqdn> \
  -p 1965:1965 \
  -v <your-content-dir>:/content \
  -v <your-certs-dir>:/.certificates \
  --restart unless-stopped \
  ja2ui0/agate
```
