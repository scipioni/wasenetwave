# Download base image ubuntu 22.04
FROM ubuntu:22.04 as ubuntu

ARG ARCHITECTURE=amd64
ENV ARCHITECTURE $ARCHITECTURE

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update

FROM ubuntu


COPY ./wisenetwave-${ARCHITECTURE}.deb /tmp

RUN dpkg -i /tmp/*.deb || true
RUN apt-get -y -f install


COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

CMD ["/entrypoint.sh"]
