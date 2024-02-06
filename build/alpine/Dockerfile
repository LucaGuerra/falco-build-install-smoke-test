FROM alpine:3.17

RUN apk update && apk add git

WORKDIR /falco
RUN git clone https://github.com/falcosecurity/falco . && git checkout 0.37.0

RUN apk update && apk add g++ gcc cmake make git bash perl linux-headers autoconf automake m4 libtool elfutils-dev libelf-static binutils bpftool clang

WORKDIR /falco/build

RUN cmake -DCPACK_GENERATOR=TGZ -DBUILD_BPF=Off -DBUILD_DRIVER=Off -DCMAKE_BUILD_TYPE=Release -DUSE_BUNDLED_DEPS=On -DUSE_BUNDLED_LIBELF=Off -DBUILD_LIBSCAP_MODERN_BPF=ON -DMUSL_OPTIMIZED_BUILD=On -DFALCO_ETC_DIR=/etc/falco ..
RUN make -j2 falco
RUN userspace/falco/falco --help
