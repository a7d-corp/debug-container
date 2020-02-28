# debug-container

These images are intended for use debugging issues in Kubernetes clusters.

## Build

Image builds should be carried out from the root directory:

```
docker build -t ${OS}-debug:latest -f ${OS}/Dockerfile
```

## Images

Both images are built nightly and available on the Docker hub:

 - [Ubuntu](https://hub.docker.com/repository/docker/glitchcrab/ubuntu-debug)
 - [Alpine](https://hub.docker.com/repository/docker/glitchcrab/alpine-debug)

## Deployment

Kubernetes manifests to deploy the images are available [here](https://github.com/glitchcrab/k8s-dbg-ymls).
