# Ua Expert Docker

Purpose of this repo is to setup the UA Expert as a containerized GUI app accessible with VNC.

# Prerequisities

- Docker Desktop (tested with 4.35)

# Setup

## UA Expert

1) download [UA Expert](https://www.unified-automation.com/fileadmin/files/client/uaexpert/uaexpert-bin-linux-x86_64-1.7.1-540.tar.gz) Linux binary (tested with v1.7.1)
2) place it in the root of this repo
3) rename to `UaExpert.AppImage`
4) `chmod +x UaExpert.AppImage`

## Docker

On mac:
- enable `Docker Desktop > Settings > Use Rosetta for x86_64/amd64 emulation on Apple Silicon`

Then:
- build `docker build --platform linux/amd64 -t ua_expert .`
- run `docker run --platform linux/amd64 --ulimit nofile=1024:1024 -p 6080:80 -p 5900:5900 -v /dev/shm:/dev/shm ua_expert`

# Usage

The image contains noVNC client to access the container with browser on `localhost:6080`.

Alternatively, use any VNC client with `localhost:5900`.

The UaExpert is located on at Desktop.

__Note:__ The connection is not secure since password is not needed. Do not use as part of the production solution.


