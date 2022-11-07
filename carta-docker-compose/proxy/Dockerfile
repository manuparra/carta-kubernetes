FROM nginx:latest

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf
COPY ./etc/carta.conf /etc/nginx/conf.d/carta.conf

COPY ./etc/ /tmp/
CMD /bin/bash /tmp/docker-init.sh