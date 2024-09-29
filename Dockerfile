FROM ubuntu:24.04

RUN apt-get update \
    && apt-get upgrade --no-install-recommends -y \
    && apt-get install --no-install-recommends -y \
    ca-certificates=20240203 \
    sudo=1.9.15p5-3ubuntu5 \
    git=1:2.43.0-1ubuntu7.1 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY ./scripts/functions /functions
COPY ./workspace/entry.sh /entry.sh

ENTRYPOINT ["bash", "/entry.sh"]
