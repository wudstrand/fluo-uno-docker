FROM goyalzz/ubuntu-java-8-maven-docker-image

LABEL maintainer="will.udstrand@gmail.com"

WORKDIR /opt/fluo-uno

# Install maven 3.6.2
ENV MAVEN_VERSION 3.6.3

RUN mv /opt/maven /opt/mavenold && \
    mv /usr/local/bin/mvn /usr/local/bin/oldmvn && \
    wget --no-verbose -O /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz https://www-us.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xzf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin  && \
    rm -f /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

ENV MAVEN_HOME /opt/maven

EXPOSE 80 443

# Install fluo-uno and accumulo-examples
RUN apt-get update \
    && apt-get install -y openssh-server \
    && git clone https://github.com/apache/fluo-uno.git ./ \
    && ./bin/uno fetch accumulo 

COPY docker-entrypoint.sh ./

ENTRYPOINT ["/bin/bash", "-c", "source docker-entrypoint.sh"]