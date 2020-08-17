#!/bin/bash
set -e

# Config Script
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
LIGHT_BLUE='\033[1;34m'
NO_COLOR='\033[0m'

NAME_KAFKA_CONTAINER="apache-kafka_kafka-1_1"
NAME_TOPIC="test-topic"
NAME_TEST_MESSAGE="testMessage.txt"

createTestTopic(){

    echo "\n${BLUE}[ACTION]${NO_COLOR} Creating Test topic "

    cmd="docker container exec -it $NAME_KAFKA_CONTAINER kafka-topics --create --topic $NAME_TOPIC   --bootstrap-server localhost:9092"
    
    $cmd

    echo "\n${GREEN}[INFO]${NO_COLOR} Test Topic created"

}

showAllTopics(){

    echo "\n${BLUE}[ACTION]${NO_COLOR} Show all topics"

    cmd="docker container exec -it $NAME_KAFKA_CONTAINER kafka-topics --list --bootstrap-server localhost:9092"
    
    $cmd

    sleep 1

}

copyMessageInContainer(){

    echo "\n${BLUE}[ACTION]${NO_COLOR} Copy test message in container"

    cmd="docker cp $NAME_TEST_MESSAGE $NAME_KAFKA_CONTAINER:/home"

    $cmd

    sleep 1

    echo "\n${GREEN}[INFO]${NO_COLOR} Copied message in container"

}

sendMessage(){

    echo "\n${BLUE}[ACTION]${NO_COLOR} Send message to topic"

    docker container exec -it $NAME_KAFKA_CONTAINER /bin/bash -c 'cat home/'$NAME_TEST_MESSAGE' | kafka-console-producer --topic $NAME_TOPIC --bootstrap-server localhost:9092'

    sleep 10

    echo "\n${GREEN}[INFO]${NO_COLOR} Message Sended"
}

recieveMessage(){
    
    echo "\n${BLUE}[ACTION]${NO_COLOR} Receiving message for topic '$NAME_TOPIC'"

    cmd="docker container exec -it $NAME_KAFKA_CONTAINER kafka-console-producer --topic $NAME_TOPIC --bootstrap-server localhost:9092"

    $cmd

    echo "\n${GREEN}[INFO]${NO_COLOR} Message received"
}

deleteTopics(){

    echo "\n${BLUE}[ACTION]${NO_COLOR} Delete Topics used for test"

    cmd="docker container exec -it $NAME_KAFKA_CONTAINER kafka-topics --delete --topic $NAME_TOPIC --bootstrap-server localhost:9092"

    $cmd

    echo "\n${GREEN}[INFO]${NO_COLOR} Deleted Topics"
}



echo "\nTEST KAFKA INFRASTRUCTURE\n"

createTestTopic
showAllTopics
copyMessageInContainer
sendMessage
recieveMessage
sleep 10
deleteTopics

echo "\n${GREEN}[INFO]${NO_COLOR} Test Kafka Infrastructure Success"
