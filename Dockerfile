FROM debian
RUN apt update \
  && apt install ssh wget -y \
  && mkdir /run/sshd \
  && mkdir /etc/frp \
  && wget -O /frpc "https://raw.githubusercontent.com/jzl1/huochetou/main/frpc" \
  && wget -O /start.sh "https://raw.githubusercontent.com/jzl1/huochetou/main/start.sh" \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && echo root:qP7x98MVHW|chpasswd \
  && chmod 755 /frpc \
  && chmod 755 /start.sh 
CMD /start.sh
