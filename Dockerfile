 FROM ubuntu:22.04 as main-linux-amd64
ARG DEBIAN_FRONTEND=noninteractive

COPY ./download/wisenetwave-amd64.deb /tmp

RUN apt-get update && \
    apt install -y /tmp/*.deb && \
    apt install -y curl && \
    rm -rf /var/lib/apt/lists/* && \
    rm -f /tmp/*.deb

COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh


FROM ubuntu:22.04 as main-linux-arm64

COPY ./download/wisenetwave-arm64.zip /tmp
RUN apt-get update && \
    apt-get install -y unzip libglib2.0-0 && \
    apt-get install -y curl iputils-ping && \
    rm -rf /var/lib/apt/lists/*
RUN cd /tmp && unzip *.zip && ./install.sh
RUN rm -fR /tmp/*
COPY entrypoint-arm64.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh


FROM main-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}

CMD ["/entrypoint.sh"]
