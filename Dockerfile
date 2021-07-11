FROM debian:bullseye-slim

ENV PATH="/Ndless/ndless-sdk/toolchain/install/bin:/Ndless/ndless-sdk/bin:${PATH}"

RUN apt update \
    && apt -y install g++ git libmpc-dev libboost-program-options-dev make php python3-dev texinfo wget zlib1g-dev \
    && git clone --recursive https://github.com/ndless-nspire/Ndless.git \
    && cd /Ndless/ndless-sdk/toolchain/ \
    && ./build_toolchain.sh \
    && rm -rf download \
    && cd .. \
    && make all \
    && apt -y autoremove --purge g++ git php python3-dev texinfo wget zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*
