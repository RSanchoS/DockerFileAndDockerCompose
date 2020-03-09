FROM tomcat:9-jdk8-openjdk-slim

RUN mv /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps