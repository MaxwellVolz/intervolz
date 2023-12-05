

- [General](#general)
    - [About](#about)
    - [Config](#config)
    - [Prereqs](#prereqs)
  - [Running](#running)
    - [Build](#build)
    - [Run Docker](#run-docker)

# General

### About

The Dockerfile is the cornerstone of your Dockerized Jenkins setup. Here's a more detailed look into what it might contain:

- Base Image: Start from the official Jenkins Docker image. This image is well-maintained and designed to be extended.
- Installing Dependencies: If your Jenkins instance requires additional system packages, install them here. Remember to switch back to the Jenkins user after installations.
- Pre-installing Plugins: You can automate the installation of Jenkins plugins by copying a list of plugin names into the container and using Jenkins' provided script to install them.

### Config

- Jenkins Configuration as Code (JCasC) defines the Jenkins configurations. This allows you to version control your Jenkins configuration.
- Copy the JCasC YAML file in /docker-jenkins into your Docker image to auto-configure Jenkins on startup.
- Additional customization that can be achieved through scripts or Jenkins' Groovy hooks.
    - These scripts can be used to automate further configuration tasks, user setup, security settings, etc.

### Prereqs

| Service | Check                       | Install |
| ------- | --------------------------- | ------- |
| git     | git -v                      |         |
| docker  | sudo docker run hello-world |         |



## Running

### Build

```sh
docker build -t my-custom-jenkins .
```

### Run Docker

```sh
docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home my-custom-jenkins
```