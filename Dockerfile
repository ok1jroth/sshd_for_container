FROM debian
RUN apt update
RUN apt install ssh wget -y
RUN mkdir /run/sshd
RUN curl -s https://install.zerotier.com | bash
RUN echo '/usr/sbin/sshd -D' >>/1.sh
RUN echo 'zerotier-cli join $network ' >>/1.sh
RUN echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config 
RUN echo root:uncleluo|chpasswd
RUN chmod 755 /1.sh
EXPOSE 80 8888 443 5130 5131 5132 5133 5134 5135 3306
CMD  /1.sh
