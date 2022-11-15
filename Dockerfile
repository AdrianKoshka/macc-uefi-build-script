FROM --platform=linux/arm64 docker.io/python:3.11

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential acpica-tools device-tree-compiler uuid-dev libssl-dev git

WORKDIR /opt
ENTRYPOINT ["python", "/opt/kickoff.py"]
