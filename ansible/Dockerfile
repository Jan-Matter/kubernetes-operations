FROM python:3.12-slim

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    sshpass \
    openssh-client \
    nmap \
    && rm -rf /var/lib/apt/lists/*
    
WORKDIR /ansible
COPY requirements.txt /ansible
RUN pip install -r requirements.txt
RUN ansible-galaxy collection install community.general

COPY ./playbooks /ansible/playbooks
COPY ./inventories /ansible/inventories
COPY ./scheduler /ansible/scheduler
COPY ansible.cfg /ansible
COPY env_variables /ansible
COPY *.yml /ansible
RUN mkdir -p /ansible/secrets
ENTRYPOINT ["/bin/bash"]
