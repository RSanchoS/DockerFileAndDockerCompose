# DockerFileAndDockerCompose
DockerFile and Docker Compose examples

## .env File

VOLUME_PATH = Path to local file 

POSTGRES_PASS= Password for Postgres database

ELASTICSEARCH_HOSTS= Url elastic search instance

ELASTIC_STACK_NETWORK= Docker network for elastic stack

ELASTIC_STACK_VERSION= Version Elastic Stack


## DockerCompose

### Elastic Stack

Docker compose with Elastic search and Kibana

To enter in Kibana

http://localhost:5601

## Dockerfiles

### Jenkins with Docker

Jenkins with Docker install for launch container in Jenkins pipeline.

To build image

`docker build -t jenkinswithdocker:0.1 -f jenkins_with_docker.Dockerfile . `

To launch image

`docker run -p 8080:8080 -p 5000:5000 jenkinswithdocker:0.1`

### Tomcat

Tomcat image with move /webapps.dist files move to /webapps

`docker build -t tomcat:0.1 -f tomcat.Dockerfile . `


## Utils

### aws-s3.conf

Config file for connect to S3 bucket in AWS.