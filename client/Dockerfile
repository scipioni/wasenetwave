# Download base image ubuntu 22.04
FROM ubuntu:22.04 as ubuntu

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y libxcomposite1 libxdamage1 libxrandr2 libxtst6 


FROM ubuntu


COPY ./wisenetclient.deb /tmp

RUN dpkg -i /tmp/*.deb || true
RUN apt-get -y -f install


COPY entrypoint.sh /entrypoint.sh
RUN chmod u+x /entrypoint.sh

CMD ["/entrypoint.sh"]
