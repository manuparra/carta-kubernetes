FROM python:3.6

RUN pip install kubernetes

RUN mkdir /data/
WORKDIR /data/

COPY ./run-list-pods.py /data/
COPY ./nginx-deployment.yaml /data/

CMD python3 ./run-list-pods.py

