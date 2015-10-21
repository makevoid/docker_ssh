# sshd
#
# VERSION               0.2.0

# FROM ubuntu:14.04
FROM debian:7



RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# hack for loading a password
ADD build-env /build-env
RUN ["/bin/bash", "-c", "source build-env && echo \"root:${SSH_PASS}\" | chpasswd"]

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN passwd -e root

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
