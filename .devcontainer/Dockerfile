FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install Terraform
ARG TERRAFORM_VERSION=1.6.4
RUN apt-get update && apt-get install -y \
    unzip \
    && curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
    && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Optionally install cloud CLI tools (AWS, Azure, GCP)
RUN apt-get install -y \
    awscli \
    azure-cli \
    google-cloud-cli

# Clean up
RUN apt-get autoremove -y && apt-get clean -y