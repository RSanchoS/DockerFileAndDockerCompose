FROM jenkins/jenkins

USER root

RUN apt-get update || apt-get install docker-ce docker-ce-cli containerd.io


