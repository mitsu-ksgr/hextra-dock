hextra-dock
===========

Hextra Dock is for previewing markdown documents locally.

Run Hugo with hextra theme on the docker container.


## How to use

- bind your docs with `-v ./your-docs:/docs`.
- if you want use `hugo.toml` (config files), bind with `-v ./hugo.toml:/conf/hugo.toml`.

```sh
# Pull the docker image.
$ docker pull ghcr.io/mitsu-ksgr/hextra-dock:latest

# Run
$ docker run --rm -it -p 1313:1313 -v ./your-docs:/docs ghcr.io/mitsu-ksgr/hextra-dock:latest

# use hugo.toml
$ docker run --rm -it -p 1313:1313 -v ./your-docs:/docs -v ./hugo.toml:/conf/hugo.toml ghcr.io/mitsu-ksgr/hextra-dock:latest
```


## References
- [Hugo](https://gohugo.io/)
- [Hextra - Hugo Theme](https://imfing.github.io/hextra/)

