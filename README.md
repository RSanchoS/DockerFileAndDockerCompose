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

## Apache-Kafka

### Instruccions for command line

ADD TOPIC 

`docker container exec -it Apache-Kafka-Container kafka-topics --create --topic Topic-Name --bootstrap-server localhost:9092`

SHOW TOPIC

`docker container exec -it Apache-Kafka-Container kafka-topics --describe --topic Topic-Name --bootstrap-server localhost:9092`

SHOW ALL TOPICS

`docker container exec -it Apache-Kafka-Container kafka-topics --list --bootstrap-server localhost:9092`

PRODUCE MESSAGE

`docker container exec -it Apache-Kafka-Container kafka-console-producer --topic Topic-Name --bootstrap-server localhost:9092`

READ MESSAGE

`docker container exec -it Apache-Kafka-Container kafka-console-consumer --topic Topic-Name --from-beginning --bootstrap-server localhost:9092`


COPY TEXT FILE

`docker cp testMessage.txt Apache-Kafka-Container:/home`

PRODUCE MESSAGE FROM FILE 

`docker container exec -it Apache-Kafka-Container /bin/bash -c 'cat testMessage.txt | kafka-console-producer --topic Topic-Name --bootstrap-server localhost:9092'`

DELETE TOPICS

`docker container exec -it Apache-Kafka-Container kafka-topics --delete --topic Topic-Name --bootstrap-server localhost:9092`