# based on this dockerfile: https://github.com/bitnami/readme-generator-for-helm/blob/main/Dockerfile
# modified to enable grabbing the repository for installation
FROM node:16
WORKDIR /app
RUN git clone --single-branch https://github.com/bitnami/readme-generator-for-helm.git .
RUN npm install
RUN ln -s /app/bin/index.js /app/bin/readme-generator
ENV PATH="/app/bin:$PATH"
ENTRYPOINT [ "readme-generator" ]
