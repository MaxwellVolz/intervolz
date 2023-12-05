FROM jenkins/jenkins:lts

USER root

# Update package list and install essentials
RUN apt-get update && apt-get install -y \
    docker-ce-cli \
    git \
    # any other packages you need \
    && rm -rf /var/lib/apt/lists/*

USER jenkins

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
ENV CASC_JENKINS_CONFIG /usr/share/jenkins/ref/jenkins.yaml
