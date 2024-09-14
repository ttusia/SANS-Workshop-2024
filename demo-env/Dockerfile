FROM alpine:3.20

RUN apk update && \ 
    apk add git python3 py3-pip gcc python3-dev musl-dev linux-headers libffi-dev bash  && \
    ln -sf python3 /usr/bin/python   && \
    ln -sf pip3 /usr/bin/pip && \ 
    LATEST_VERSION=$(wget -O - "https://api.github.com/repos/open-policy-agent/conftest/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c 2-) && \
    ARCH=$(arch)  && \
    if [[ "$ARCH" == "aarch64" ]]; then ARCH="arm64"; fi && \
    SYSTEM=$(uname)  && \
    echo wget "https://github.com/open-policy-agent/conftest/releases/download/v${LATEST_VERSION}/conftest_${LATEST_VERSION}_${SYSTEM}_${ARCH}.tar.gz" && \
    wget "https://github.com/open-policy-agent/conftest/releases/download/v${LATEST_VERSION}/conftest_${LATEST_VERSION}_${SYSTEM}_${ARCH}.tar.gz" && \
    tar xzf conftest_${LATEST_VERSION}_${SYSTEM}_${ARCH}.tar.gz && \
    mv conftest /usr/local/bin && \
    pip install localstack --break-system-packages && \
    pip install awscli --break-system-packages && \ 
    pip install terraform-local --break-system-packages && \
    wget "https://releases.hashicorp.com/terraform/1.8.5/terraform_1.8.5_linux_${ARCH}.zip"  && \
    unzip terraform_1.8.5_linux_${ARCH}.zip && \
    mv terraform /usr/local/bin && \
    rm LICENSE.txt

ENTRYPOINT [ "sh" ]