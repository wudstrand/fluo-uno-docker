FROM goyalzz/ubuntu-java-8-maven-docker-image

LABEL maintainer="will.udstrand@gmail.com"

WORKDIR /opt/fluo-uno

# Install fluo-uno
RUN apt-get update \
    && apt-get install -y openssh-server \
    && git clone https://github.com/apache/fluo-uno.git ./ \
    && ./bin/uno fetch accumulo

COPY docker-entrypoint.sh ./

ENTRYPOINT ["/bin/bash", "-c", "source docker-entrypoint.sh"]