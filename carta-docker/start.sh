cd carta-controller
docker build . --tag carta-controller
docker run -it -d --name carta-ldap -p 389:389 -p 636:636  --detach larrycai/openldap
docker run -it -d --name carta-mongodb -p 27017:27017  -d mongo
sleep 5
cd ..
cd carta-nginx
docker build . --tag carta-nginx
docker run -it -d  -p 8000:8000 --name carta-controller carta-controller
sleep 5
docker run -it -d -p 8081:8081 --name carta-nginx carta-nginx




