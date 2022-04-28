# Usage: 
# docker ps -a -q | xargs docker rm -f ; docker build -f container_with_apache.dockerfile -t httpd-perso --build-arg DOCKER_ROOT_PASS="aza" . ; docker run -d -t -p 2222:22 -p 5050:5000 -p 8080:80 --name bob httpd-perso:latest 
# && ssh -p 2222 root@localhost

FROM continuumio/miniconda3:latest
SHELL ["/bin/bash", "-c"]

COPY requirement.yml app_dash.py /root/
COPY bin/ /root/bin/

WORKDIR /root


RUN apt update && apt install -y --no-install-recommends vim && \
conda env create -f /root/requirement.yml 

CMD /root/bin/gunicorn_start
