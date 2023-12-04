#!/bin/bash
eval $(minikube docker-env)
minikube status
docker info
docker build -t my-web-server .