FROM ubuntu:24.04

# Any subsequent commands that install packages run non-interactively.
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update \
    && apt upgrade -y \
    && apt install -y sudo git \
    && apt autoremove -y \
    && apt autoclean -y


COPY ./scripts/functions.sh /functions.sh
COPY ./workspace/entry.sh /entry.sh

ENTRYPOINT ["bash", "/entry.sh"]
