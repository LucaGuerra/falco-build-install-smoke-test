FROM ubuntu:23.04

# the below line is necessary in order to install 'tzdata' which is necessary as a dependency
# won't be needed on real systems
ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Rome"

RUN apt-get update && apt-get install git -y

WORKDIR /falco
RUN git clone https://github.com/falcosecurity/falco . && git checkout 0.37.0

RUN apt-get install git cmake build-essential libelf-dev -y

WORKDIR /falco/build

RUN cmake -DUSE_BUNDLED_DEPS=ON ..
RUN make -j2 falco
RUN userspace/falco/falco --help
