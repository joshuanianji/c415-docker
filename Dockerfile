FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install build-essential pkg-config uuid-dev openjdk-17-jre git cmake -y && \
    apt-get clean

