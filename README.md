# rancheros-git

A tool for run git using Docker in Rancheros

## Supported tags and Dockerfile links

-	[`latest` (*Dockerfile*)](https://github.com/rcastropolizainformatica/rancheros-git/blob/main/Dockerfile)
-	[`v1.0.0` (*Dockerfile*)](https://github.com/rcastropolizainformatica/rancheros-git/blob/v1.0.0/Dockerfile)

## Volumes

You can mount your CA certificates folder on /usr/local/share/ca-certificates for using private CA certificates

# How to use

### Command Line

Basic use:
```bash
docker build -t rancheros-git .
docker run -ti --rm \
    -v ${HOME}:/home/rancher -v $(pwd):/git \
    rancheros-git command
```
Private CA certificates:
```bash
docker build -t rancheros-git .
docker run -ti --rm \
    -v /path/to/cacerts:/usr/local/share/ca-certificates \
    -v ${HOME}:/home/rancher -v $(pwd):/git \
    rancheros-git command
```