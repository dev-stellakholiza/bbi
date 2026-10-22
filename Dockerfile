FROM python:3.12-slim

WORKDIR /workspace

RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    ca-certificates \
    curl \
    jq \
    unzip \
    git \
    awscli \
    && rm -rf /var/lib/apt/lists/*

COPY dadan.sh /opt/ml/processing/input/dadan.sh
RUN chmod +x /opt/ml/processing/input/dadan.sh

ENTRYPOINT ["/bin/bash", "/opt/ml/processing/input/dadan.sh"]