FROM debian
RUN apt update \
  && apt install ssh wget -y \
  && mkdir /run/sshd \
  && mkdir /etc/frp \
  && wget -O /usr/bin/frpc "https://raw.githubusercontent.com/jzl1/huochetou/main/frpc" \
  && wget -O /start.sh "https://raw.githubusercontent.com/jzl1/huochetou/main/start.sh" \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && echo root:qP7x98MVHW|chpasswd \
  && chmod 755 /usr/bin/frpc \
  && chmod 755 /start.sh \
  && chmod 755 /1.sh
CMD  /start.sh

## deploy
