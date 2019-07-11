FROM ubuntu:14.04

RUN apt-get update &&\
    apt-get install -y \
    curl

RUN curl -fSL -o ~/steam.deb https://steamcdn-a.akamaihd.net/client/installer/steam.deb &&\
    dpkg -i ~/steam.deb || apt-get install -yq --no-install-recommends -f

RUN apt-get update -yq && apt-get install -yq --no-install-recommends sudo ca-certificates procps adduser curl \
    && echo "gamer     ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/gamer \
    && adduser --disabled-password --gecos gamer gamer

USER gamer
ENV USER gamer
ENV DISPLAY :0.0

CMD steam