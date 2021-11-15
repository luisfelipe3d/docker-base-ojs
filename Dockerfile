FROM alpine:3.14

LABEL maintainer="Luis Leal <luisfelipe@lepidus.com.br>" \
      description="Provide an container base with ojs and verify \
the checksum to process multi-stage" \
      version="1.0"

ENV ojs_version=3.3.0-8
ENV SHA512SUM="ab31fca4086c3875ddc99ed635b4af0787f709e62dece0f0a5f4d2d64f2f749f1601206bb043ea450f3c91d7547b1ff004f538b1b39aa50e9c5553a8c9099953  ojs-3.3.0-8.tar.gz"

WORKDIR /app

RUN wget https://pkp.sfu.ca/ojs/download/ojs-$ojs_version.tar.gz && \
    echo "$SHA512SUM" |sha3sum -a 512 -c && \
    tar -xf ojs-$ojs_version.tar.gz && \
    rm ojs-$ojs_version.tar.gz
