FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install build-essential pkg-config uuid-dev openjdk-17-jre git cmake curl -y && \
    apt-get clean

# $HOME is `/root`
ENV ANTLR_PARENT=/root/antlr
ENV SRC_DIR=$ANTLR_PARENT/antlr4 
ENV BUILD_DIR=$SRC_DIR/antlr4-build
ENV INSTALL_DIR=$ANTLR_PARENT/antlr4-install

# install ANTLR4
WORKDIR ${ANTLR_PARENT}
RUN git clone --depth 1 --branch 4.13.0 https://github.com/antlr/antlr4.git
RUN mkdir antlr4-install antlr4/antlr4-build
WORKDIR ${BUILD_DIR}
RUN cmake ${SRC_DIR}/runtime/Cpp/ \
    -DCMAKE_BUILD_TYPE=RELEASE \
    -DCMAKE_INSTALL_PREFIX="${INSTALL_DIR}"
RUN make install -j4

ENV ANTLR_INS="${INSTALL_DIR}"

# Install ANTLR Generator
WORKDIR ${INSTALL_DIR}/bin 
RUN curl https://www.antlr.org/download/antlr-4.13.0-complete.jar -o antlr-4.13.0-complete.jar
ENV ANTLR_JAR="${ANTLR_INS}/bin/antlr-4.13.0-complete.jar"
ENV CLASSPATH="$ANTLR_JAR:$CLASSPATH"
COPY files/.bashrc /root/.bashrc
