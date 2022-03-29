### Agent with Terraform and aws cli
# FROM google/cloud-sdk:slim

FROM jeanflores2c93/base-jenkins-agents

# Installing terraform
RUN apt-get -y install unzip && \
    cd /tmp && \
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip && \
    unzip /tmp/terraform.zip && \
    cp /tmp/terraform /usr/local/bin && \
    chmod a+x /usr/local/bin/terraform && \
    apt-get -y remove unzip && \
    apt-get clean && \
    rm /tmp/terraform /tmp/terraform.zip

# Downloading gcloud package
RUN curl https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz > /tmp/google-cloud-sdk.tar.gz

# Installing the package
RUN mkdir -p /usr/local/gcloud \
  && tar -C /usr/local/gcloud -xvf /tmp/google-cloud-sdk.tar.gz \
  && /usr/local/gcloud/google-cloud-sdk/install.sh

# Adding the package path to local
ENV PATH $PATH:/usr/local/gcloud/google-cloud-sdk/bin

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]