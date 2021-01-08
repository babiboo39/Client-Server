FROM ubuntu:18.04

LABEL maintainer="ruli"

RUN apt-get -y update && apt-get install -y openssh-server
RUN apt-get clean
RUN mkdir /var/run/sshd
RUN echo 'root:nethertoxin' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in user profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]