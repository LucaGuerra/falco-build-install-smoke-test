FROM registry.suse.com/bci/bci-base:15.5

RUN zypper -n install git

WORKDIR /falco
RUN git clone https://github.com/falcosecurity/falco . && git checkout 0.37.0

RUN zypper -n install gcc12 gcc12-c++ cmake make libelf-devel gawk
WORKDIR /falco/build

RUN ln -s $(which gcc-12) /usr/bin/gcc
RUN ln -s $(which g++-12) /usr/bin/g++

RUN cmake -DUSE_BUNDLED_DEPS=ON ..
RUN make -j2 falco
RUN userspace/falco/falco --help
