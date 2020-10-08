[![Blog](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Discord&logo=discord)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=discourse)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub&logo=github)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=Supporters&logo=open%20collective)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring:

* regular and timely application updates
* easy user mappings (PGID, PUID)
* custom base image with s6 overlay
* weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
* regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/yq](https://github.com/linuxserver/docker-yq)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-yq.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-yq)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-yq.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&logo=github)](https://github.com/linuxserver/docker-yq/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitHub%20Package&logo=github)](https://github.com/linuxserver/docker-yq/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab)](https://gitlab.com/Linuxserver.io/docker-yq/container_registry)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/yq.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge)](https://microbadger.com/images/linuxserver/yq "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/yq.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/linuxserver/yq)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/yq.svg?color=94398d&labelColor=555555&logoColor=ffffff&style=for-the-badge&label=stars&logo=docker)](https://hub.docker.com/r/linuxserver/yq)
[![Jenkins Build](https://img.shields.io/jenkins/build?labelColor=555555&logoColor=ffffff&style=for-the-badge&jobUrl=https%3A%2F%2Fci.linuxserver.io%2Fjob%2FDocker-Pipeline-Builders%2Fjob%2Fdocker-yq%2Fjob%2Fmaster%2F&logo=jenkins)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-yq/job/master/)

[yq](https://github.com/kislyuk/yq): Command-line YAML/XML processor - jq wrapper for YAML and XML documents. This image includes `yq`, `jq`, and `xq`.

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/yq` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |

## Usage

### Docker cli

```
docker run --rm \
  -v "$PWD:$PWD" \
  -w="$PWD" \
  --entrypoint yq \
  linuxserver/yq \
  .foo.bar input.yml
```
You can replace the last line with any yq command and argument, which will be passed to yq inside the image.

```
docker run --rm \
  -v "$PWD:$PWD" \
  -w="$PWD" \
  --entrypoint jq \
  linuxserver/yq \
  .foo.bar input.json
```
You can replace the last line with any jq command and argument, which will be passed to jq inside the image.

```
docker run --rm \
  -v "$PWD:$PWD" \
  -w="$PWD" \
  --entrypoint xq \
  linuxserver/yq \
  .foo.bar input.xml
```
You can replace the last line with any xq command and argument, which will be passed to xq inside the image.

### Recommended method

We provide a very convenient script that allows the yq container to run as if it was installed natively:
```
sudo curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-yq/master/run-yq.sh -o /usr/local/bin/yq
sudo chmod +x /usr/local/bin/yq
```
Running these two commands on your docker host once will let you issue commands such as `yq .foo.bar input.yml` and the yq container will do its job behind the scenes.

```
sudo curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-yq/master/run-jq.sh -o /usr/local/bin/jq
sudo chmod +x /usr/local/bin/jq
```
Running these two commands on your docker host once will let you issue commands such as `jq .foo.bar input.json` and the jq container will do its job behind the scenes.

```
sudo curl -L --fail https://raw.githubusercontent.com/linuxserver/docker-yq/master/run-xq.sh -o /usr/local/bin/xq
sudo chmod +x /usr/local/bin/xq
```
Running these two commands on your docker host once will let you issue commands such as `xq .foo.bar input.xml` and the xq container will do its job behind the scenes.

## Docker Mods
[![Docker Mods](https://img.shields.io/badge/dynamic/yaml?style=for-the-badge&color=E68523&label=mods&query=%24.mods%5B%27yq%27%5D.mod_count&url=https%3A%2F%2Fraw.githubusercontent.com%2Flinuxserver%2Fdocker-mods%2Fmaster%2Fmod-list.yml)](https://mods.linuxserver.io/?mod=yq "view available mods for this container.")

We publish various [Docker Mods](https://github.com/linuxserver/docker-mods) to enable additional functionality within the containers. The list of Mods available for this image (if any) can be accessed via the dynamic badge above.


## Support Info

* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/yq`

## Updating Info

### Via Docker Cli
* Update the image: `docker pull linuxserver/yq`
* You can also remove the old dangling images: `docker image prune`


## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-yq.git
cd docker-yq
docker build \
  --no-cache \
  --pull \
  -t linuxserver/yq:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **07.10.20:** - Initial Release.
