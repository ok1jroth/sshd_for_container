FROM debian
RUN apt update \
  && apt install ssh wget -y \
  && mkdir /run/sshd \
  && mkdir /etc/frp \
  && wget -O /usr/bin/frpc "https://raw.githubusercontent.com/jzl1/huochetou/main/frpc" \
  && echo '[common]\nserver_addr = $server_addr\nserver_port = $server_port\ntoken = $token\n\n[ssh]\ntype = tcp\nlocal_ip = 127.0.0.1\nlocal_port = 22\nremote_port = $remote_port' >>/etc/frp/frpc.ini \
  && echo '/usr/sbin/sshd -D' >>/1.sh \
  && echo '/usr/bin/frpc -c /etc/frp/frpc.ini' >>/1.sh \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && echo root:qP7x98MVHW|chpasswd \
  && chmod 755 /usr/bin/frpc \
  && chmod 755 /1.sh \
EXPOSE 80 8888 443 5130 5131 5132 5133 5134 5135 3306
CMD  /1.sh
