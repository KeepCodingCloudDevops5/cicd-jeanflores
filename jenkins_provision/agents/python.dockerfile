FROM jeanflores2c93/base-jenkins-agent

RUN apt-get install python3

RUN apt-get update && apt-get install python3-pip python3.9-venv -y

RUN cd "$(dirname $(which python3))" && \
    ln -s idle3 idle && \
    ln -s pydoc3 pydoc && \
    ln -s python3 python && \
    ln -s python3-config python-config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]