FROM --platform=linux/amd64 docker.io/python:3.11

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y build-essential acpica-tools device-tree-compiler uuid-dev libssl-dev gcc-aarch64-linux-gnu git --install-recommends -y

WORKDIR /opt
ENTRYPOINT ["python", "/opt/kickoff.py"]