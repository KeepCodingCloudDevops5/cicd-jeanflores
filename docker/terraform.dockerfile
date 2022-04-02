### Agent with Terraform and aws cli
# FROM google/cloud-sdk:slim

FROM jeanflores2c93/base-jenkins-agents

# Installing terraform
RUN apt-get -y install unzip && \
    cd /tmp && \
    curl -o /tmp/terraform.zip https://releases.hashicorp.com/terraform/1.0.8/terraform_1.0.8_linux_amd64.zip && \
    unzip /tmp/terraform.zip && \
    cp /tmp/terraform /usr/local/bin && \
    chmod a+x /usr/local/bin/terraform && \
    apt-get -y remove unzip && \
    apt-get clean && \
    rm /tmp/terraform /tmp/terraform.zip

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
