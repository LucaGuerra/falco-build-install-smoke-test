FROM quay.io/centos/centos:stream8

RUN dnf -y install git

WORKDIR /falco

RUN git clone https://github.com/falcosecurity/falco . && git checkout 0.37.0
RUN dnf -y install gcc gcc-c++ git make cmake elfutils-libelf-devel perl-IPC-Cmd

WORKDIR /falco/build

RUN cmake -DUSE_BUNDLED_DEPS=ON ..
RUN make -j2 falco
RUN userspace/falco/falco --help
