FROM gcr.io/cloud-marketplace-tools/k8s/deployer_envsubst:latest
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    gettext \
    jq \
    uuid-runtime \
    wget \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q -O /bin/kubectl \
        https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl \
    && chmod 755 /bin/kubectl
RUN curl -Lo /usr/local/bin/tctl https://binaries.dl.tetrate.io/public/raw/versions/linux-amd64-1.3.0/tctl && chmod +x /usr/local/bin/tctl 

COPY tester.sh /tester/

WORKDIR /tester
ENTRYPOINT ["./tester.sh"]

ENV WAIT_FOR_READY_TIMEOUT 7200
ENV TESTER_TIMEOUT 7200

