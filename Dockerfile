FROM python:3.8

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential acpica-tools device-tree-compiler uuid-dev libssl-dev git

WORKDIR /opt
ENTRYPOINT ["bash", "/opt/entrypoint.sh"]
