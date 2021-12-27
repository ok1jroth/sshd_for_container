FROM debian
RUN apt update \
  && apt install ssh wget -y \
  && mkdir /run/sshd \
  && mkdir /etc/frp \
  && wget -O /usr/bin/frpc "https://raw.githubusercontent.com/jzl1/huochetou/main/frpc" \
  && echo '[common]
server_addr = $server_addr
server_port = $server_port
token = $token
[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = $remote_port' >>/etc/frp/frpc.ini \
  && echo '/usr/sbin/sshd -D' >>/1.sh \
  && echo '/usr/bin/frpc -c /etc/frp/frpc.ini' >>/1.sh \
  && echo 'PermitRootLogin yes' >>  /etc/ssh/sshd_config \
  && echo root:qP7x98MVHW|chpasswd \
  && chmod 755 /usr/bin/frpc \
  && chmod 755 /1.sh
CMD  /1.sh
