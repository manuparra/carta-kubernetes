# CARTA on kubernetes

Test bed for the deployment of Carta Visualisation tool on Kubernetes and Docker

* [Deployment based on Docker Containers](#deployment-based-on-docker-containers)
* [Deployment based on `docker-compose`](#deployment-based-on--docker-compose-)
* [Deployment on Kubernetes with `compose`](#deployment-on-kubernetes-with--compose-)

## Deployment based on Docker Containers

This deployment has been created with Carta-Controller, which is required to allow user access from distinct ways like (PAM, LDAP, OIDC, others).

This deployment contains:

- CARTA-controller, CARTA BackEnd, CARTA Frontend.
- LDAP server for authentication.
- MongoDB as UserDB.
- Nginx as web proxy.

To run this deployment type the following:

```
bash ./carta-docker/start.sh
```

To stop all the services:

```
bash ./carta-docker/stop.sh
```

## Deployment based on `docker-compose`

This deployment is based on working with the CARTA repository for SKAO. Currently the main branch and a brach to fix it are failing to generate the deployment, see the repo here: 
https://gitlab.com/ska-telescope/src/ska-carta-container/-/tree/fix-docker-issues

To fix this, we added a new branch with the solution to the particular PAM (authentication) error, but it seems that the error after this is moved to another component:
https://gitlab.com/ska-telescope/src/ska-carta-container/-/tree/manuparra-master-patch-16145

However, to set up this deployment, you can use the following:

```
cd docker-compose
docker-compose -f docker-compose.yml up --build -d
```

To stop it:

```
cd docker-compose
docker-compose -f docker-compose.yml down
```



## Deployment on Kubernetes with `compose`

```
kubectl apply -f ./kompose/
```

