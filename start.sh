/usr/sbin/sshd -D -p 22
printf '[common]\nserver_addr = ${server_addr}\nserver_port = ${server_port}\ntoken = ${token}\n\n[ssh]\ntype = tcp\nlocal_ip = 127.0.0.1\nlocal_port = 22\nremote_port = ${remote_port}' >>/etc/frp/frpc.ini
/usr/bin/frpc -c /etc/frp/frpc.ini
