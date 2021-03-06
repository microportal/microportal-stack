#!/usr/bin/env bash
STACK_NAME="microportal"
case "$1" in
    start)
        echo "Starting ${STACK_NAME} stack"
        docker-compose -p ${STACK_NAME} up -d --remove-orphans
        ;;
    start-base)
        echo "Starting base services for ${STACK_NAME} stack"
        docker-compose -p ${STACK_NAME} up -d mongo postgres keycloak
        ;;
    stop)
        echo "Stopping ${STACK_NAME} stack"
        docker-compose -p ${STACK_NAME} stop
        ;;
    restart)
        echo "Restarting ${STACK_NAME} stack"
        docker-compose -p ${STACK_NAME} restart
        ;;
    clean)
        echo "Cleaning ${STACK_NAME} stack"
        docker-compose -p ${STACK_NAME} down
        ;;
    *)
        echo "Accepted commands: start, start-base, stop, restart or clean"
        ;;
esac
