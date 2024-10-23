hextra-dock
===========

Hextra Dock is for previewing markdown documents locally.

Run Hugo with hextra theme on the docker container.


## How to use

```sh
# Pull the docker image.
$ docker pull ghcr.io/mitsu-ksgr/hextra-dock:latest

# Run
$ docker run --rm -it -p 1313:1313 -v ./your-docs:/docs ghcr.io/mitsu-ksgr/hextra-dock:latest
```

