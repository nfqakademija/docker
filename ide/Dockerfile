FROM ubuntu:14.04

RUN apt-get update && apt-get install -y firefox git nano curl default-jre build-essential

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

# Download PHPStorm
RUN curl "https://download-cf.jetbrains.com/webide/PhpStorm-2018.2.3.tar.gz" --output /tmp/PhpStorm.tar.gz && \
    tar -xzf /tmp/PhpStorm.tar.gz -C /tmp && \
    mv /tmp/PhpStorm-182.4323.68 /ide && \
    rm -f /tmp/PhpStorm.tar.gz

USER developer
ENV HOME /home/developer

VOLUME ["/home/developer", "/ide", "/code"]

CMD bash
