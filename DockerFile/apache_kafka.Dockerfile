FROM alpine:3.11.5

EXPOSE 9092

USER root

RUN apk update 
RUN apk --no-cache -q add curl

RUN curl "https://apache.brunneis.com/kafka/2.4.1/kafka_2.12-2.4.1.tgz"
RUN tar -xzf kafka_2.12-2.4.1.tgz || cd kafka_2.12-2.4.1

RUN bin/zookeeper-server-start.sh config/zookeeper.properties
RUN bin/kafka-server-start.sh config/server.properties
