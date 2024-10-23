hextra-dock
===========

Hextra Dock is for previewing markdown documents locally.

Run Hugo with hextra theme on the docker container.


## How to use

```sh
$ docker pull hextra-dock:latest
$ docker run --rm -it -p 1313:1313 -v ./your-docs:/docs hextra-dock:latest
```

