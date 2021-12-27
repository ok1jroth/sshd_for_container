#!/bin/bash
nohup /usr/sbin/sshd -D -p 22 &
echo -e "[common]\nserver_addr = ${server_addr}\nserver_port = ${server_port}\ntoken = ${token}\n\n[ssh]\ntype = tcp\nlocal_ip = 127.0.0.1\nlocal_port = 22\nremote_port = ${remote_port}" >>/etc/frp/frpc.ini
nohup /agent -s $tz_address -p $tz_secret --skip-conn --skip-procs &
nohup /frpc -c /etc/frp/frpc.ini &&
tail -f /nohup.out
