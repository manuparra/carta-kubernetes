cd carta-controller
docker build . --tag carta-controller
docker run --name carta-ldap --detach osixia/openldap:1.5.0
docker run --name carta-mongodb -d mongo
cd carta-nginx
docker build . --tag carta-nginx
docker run -it -p 8081:8081 --name carta-nginx carta-nginx
docker run -it -p 8000:8000 --name carta-controller carta-controller




