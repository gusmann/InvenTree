#!/bin/ash

# Install system packages required for building InvenTree python libraries
# Note that for postgreslql, we use the 13 version, which matches the version used in the InvenTree docker image

apk add gcc g++ musl-dev openssl-dev libffi-dev cargo python3-dev openldap-dev \
    libstdc++ build-base linux-headers py3-grpcio \
    jpeg-dev openjpeg-dev libwebp-dev zlib-dev \
    sqlite sqlite-dev \
    mariadb-connector-c-dev mariadb-client mariadb-dev \
    postgresql13-dev postgresql-libs yq curl \
    $@


install helm & kubectl
case `uname -m` in \
        x86_64) ARCH=amd64; ;; \
        armv7l) ARCH=arm; ;; \
        aarch64) ARCH=arm64; ;; \
        ppc64le) ARCH=ppc64le; ;; \
        s390x) ARCH=s390x; ;; \
        *) echo "un-supported arch, exit ..."; exit 1; ;; \
esac && \
curl -sL https://get.helm.sh/helm-v${HELM_VERSION}-linux-${ARCH}.tar.gz | tar -xvz && \
mv linux-${ARCH}/helm /usr/bin/helm && \
chmod +x /usr/bin/helm && \
rm -rf linux-${ARCH} && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${ARCH}/kubectl" && \
mv kubectl /usr/bin/kubectl && \
chmod +x /usr/bin/kubectl
