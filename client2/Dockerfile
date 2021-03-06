FROM ubuntu:18.04

LABEL maintainer="ruli"

RUN apt-get -y update && apt-get install -y openssh-server
RUN apt-get clean
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?Port\s+.*/Port 22/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?SyslogFacility\s+.*/SyslogFacility AUTH/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?LogLevel\s+.*/LogLevel INFO/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PermitEmptyPasswords\s+.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?PubkeyAuthentication\s+.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    sed -ri 's/^#?IgnoreRhosts\s+.*/IgnoreRhosts yes/' /etc/ssh/sshd_config


# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/systemd-user
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get install -y rsyslog && apt-get install -y rsync && apt-get install -y sshpass && apt-get install -y inotify-tools
RUN sed -i 's/\$RepeatedMsgReduction on/\$RepeatedMsgReduction off/g' /etc/rsyslog.conf && \
    sed -i '/imklog/s/^/#/' /etc/rsyslog.conf

EXPOSE 22

CMD rsyslogd & sh /home/alphaClient.sh & /usr/sbin/sshd -D