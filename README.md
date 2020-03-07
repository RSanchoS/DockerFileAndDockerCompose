# DockerFileAndDockerCompose
DockerFile and Docker Compose examples

## DockerCompose

## Dockerfiles

### Jenkins with Docker

Jenkins with Docker install for launch container in Jenkins pipeline.

To build image

`docker build -t jenkinswithdocker:0.1 -f jenkins_with_docker.Dockerfile . `

To launch image

`docker run -p 8080:8080 -p 5000:5000 jenkinswithdocker:0.1`
