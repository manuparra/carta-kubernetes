FROM nginx:latest

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf
COPY ./carta.conf /etc/nginx/conf.d/carta.conf

EXPOSE 8081

CMD nginx