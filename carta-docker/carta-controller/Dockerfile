FROM centos:8

RUN cd /etc/yum.repos.d/ && sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN dnf module -y  enable nodejs:16
RUN dnf install -y nodejs npm

RUN dnf install -y python3 make gcc-c++
RUN npm install -g --unsafe-perm carta-controller


RUN curl https://packages.cartavis.org/cartavis-el8.repo --output /etc/yum.repos.d/cartavis.repo
RUN dnf -y install 'dnf-command(config-manager)'
RUN dnf -y install epel-release
RUN dnf -y config-manager --set-enabled powertools
RUN dnf -y install carta-backend

RUN adduser carta
RUN mkdir -p /var/log/carta
RUN chown -R carta /var/log/carta

COPY ./sudoer-carta-controller  /etc/sudoers.d/carta_controller

RUN mkdir /etc/carta
RUN chown -R carta /etc/carta
WORKDIR /etc/carta

RUN openssl genrsa -out carta_private.pem 4096
RUN openssl rsa -in carta_private.pem -outform PEM -pubout -out carta_public.pem

COPY ./config.json /etc/carta/config.json
COPY ./backend.json /etc/carta/backend.json

RUN groupadd carta-users
RUN useradd -G carta-users -p $(openssl passwd -crypt test) bob
RUN groupadd shadow
RUN chgrp shadow /etc/shadow
RUN chmod g+r /etc/shadow
RUN usermod -a -G shadow carta

EXPOSE 8000

CMD carta-controller