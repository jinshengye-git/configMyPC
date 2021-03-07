# setup docker DIGITS with gpu 

Docker is an awesome way that we can build our own environment.
It is much faster than vitural machine and also can use CUDA.

## install docker

[docker install instruction](https://docs.docker.com/engine/install/ubuntu/)

run :
```
sudo chmod 666 /var/run/docker.sock
```
to fix the Permission deny issue.



## Pull Digits from NGC

```
docker pull nvcr.io/nvidia/digits:21.02-tensorflow-py3
```


## to run docker image

follow the [NGC instruction](https://ngc.nvidia.com/catalog/containers/nvidia:digits)

```
docker run --gpus all -it --rm -v /mnt/b58db28e-c8ea-48a6-a3b6-570973c131ac/data:/data nvcr.io/nvidia/digits:21.02-tensorflow-py3
```


## to stop all container of docker

```
docker stop $(docker ps -a -q)
```


## Some resources of docker

[docker beginner's manual](https://www.freecodecamp.org/news/a-beginners-guide-to-docker-how-to-create-your-first-docker-application-cc03de9b639f/)

[A Beginner’s Guide to Docker — How to Create a Client/Server Side with Docker-Compose](https://herewecode.io/blog/a-beginners-guide-to-docker-how-to-create-a-client-server-side-with-docker-compose/)
