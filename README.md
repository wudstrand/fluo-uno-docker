# Apache Fluo-uno Docker Image
**This image is not intended to be used in a production environment, but rather it is intended to be used locally for testing and developing with [Apache's fluo-uno](https://github.com/apache/fluo-uno).** 

# Obtain the docker image
`docker pull wudstrand/fluo-uno-docker`

or 

```bash
git pull https://github.com/WillUdstrand/fluo-uno-docker.git
cd fluo-uno-docker
docker build . 
```

# Running the docker image
`docker run -p 50070:50070 -p 8088:8088 -p 9995:9995 -it <contianer tag> bash`
