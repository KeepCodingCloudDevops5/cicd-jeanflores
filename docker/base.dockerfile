FROM ubuntu:21.10

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -qy git wget software-properties-common openssh-server curl && \
    sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd && \
    mkdir -p /var/run/sshd && \
    apt-get install -qy openjdk-8-jdk && \
    apt-get install -qy maven && \
    useradd -ms /bin/bash jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir /home/jenkins/.m2

RUN mkdir /home/jenkins/.ssh/ && \
    touch /home/jenkins/.ssh/authorized_keys

RUN chown -R jenkins:jenkins /home/jenkins/.m2/ && \
    chown -R jenkins:jenkins /home/jenkins/.ssh/

# RUN apt-get install python3

# RUN apt-get update && apt-get install python3-pip python3.9-venv -y

# RUN cd "$(dirname $(which python3))" && \
#     ln -s idle3 idle && \
#     ln -s pydoc3 pydoc && \
#     ln -s python3 python && \
#     ln -s python3-config python-config

# COPY .pypirc /home/jenkins/

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]