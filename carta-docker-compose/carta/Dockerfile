FROM ubuntu:20.04

ARG USERNAME=cartauser
ARG PASSWORD=password

RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get -y install sudo software-properties-common && \
  add-apt-repository ppa:cartavis-team/carta

RUN \
  apt-get -y install carta-backend curl g++ make vim

RUN \
  adduser --system --home /var/lib/carta --shell=/bin/bash --group carta && \
  usermod -a -G shadow carta && \
  mkdir -p /var/log/carta && \
  chown carta: /var/log/carta && \
  mkdir -p /etc/carta && \
  chown carta: /etc/carta

COPY ./etc/config/carta_controller /etc/sudoers.d/carta_controller

# Add default user for PAM authentication
RUN useradd --create-home --shell /bin/bash $USERNAME
RUN echo "$USERNAME:$PASSWORD" | chpasswd
RUN groupadd carta-users
RUN usermod -a -G carta-users $USERNAME

# Install NodeJS LTS
RUN \
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && \
  apt-get install -y nodejs build-essential

RUN \
  sudo npm install -g --unsafe-perm carta-controller && \
  sudo npm install -g pm2 && \
  sudo su - carta

WORKDIR /etc/carta

RUN \
  openssl genrsa -out carta_private.pem 4096 && \
  openssl rsa -in carta_private.pem -outform PEM -pubout -out carta_public.pem

COPY ./etc/config/config.json /etc/carta/config.json
COPY ./etc/config/backend.json /etc/carta/backend.json
COPY ./assets/images/skao_logo.gif /opt/images/skao_logo.gif

COPY ./etc/ /tmp/
CMD /bin/bash /tmp/docker-init.sh
