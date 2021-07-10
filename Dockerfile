FROM debian:bullseye-slim

RUN apt update && apt -y install g++ git libmpc-dev libboost-program-options-dev make php python3-dev texinfo wget zlib1g-dev && git clone --recursive https://github.com/ndless-nspire/Ndless.git

WORKDIR /Ndless/ndless-sdk/toolchain/
RUN ./build_toolchain.sh && rm -rf /Ndless/ndless-sdk/toolchain/download

ENV PATH="/Ndless/ndless-sdk/toolchain/install/bin:/Ndless/ndless-sdk/bin:${PATH}"

WORKDIR /Ndless/ndless-sdk
RUN make all
