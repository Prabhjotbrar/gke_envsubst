ARG MARKETPLACE_TOOLS_TAG
FROM gcr.io/cloud-marketplace-tools/k8s/deployer_envsubst:$MARKETPLACE_TOOLS_TAG

RUN mkdir -p /data/artifacts

COPY manifest /data/manifest
COPY artifacts /data/artifacts
COPY schema.yaml /data/
COPY apptest/deployer /data-test/

RUN mkdir -p ~/.tctl/bin
RUN curl -Lo ~/.tctl/bin/tctl https://binaries.dl.tetrate.io/public/raw/versions/linux-amd64-1.4.0-EA3/tctl
RUN curl -Lo ~/.tctl/bin/kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.20.4/2021-04-12/bin/linux/amd64/kubectl
RUN chmod +x ~/.tctl/bin/tctl
RUN chmod +x ~/.tctl/bin/kubectl
RUN export PATH=$PATH:~/.tctl/bin

# Provide registry prefix and tag for default values for images.
ARG REGISTRY
ARG TAG
RUN cat /data/schema.yaml \
    | env -i "REGISTRY=$REGISTRY" "TAG=$TAG" envsubst \
    > /data/schema.yaml.new \
    && mv /data/schema.yaml.new /data/schema.yaml

RUN cat /data-test/schema.yaml \
    | env -i "REGISTRY=$REGISTRY" "TAG=$TAG" envsubst \
    > /data-test/schema.yaml.new \
    && mv /data-test/schema.yaml.new /data-test/schema.yaml

ENV WAIT_FOR_READY_TIMEOUT 3600
ENV TESTER_TIMEOUT 3600
