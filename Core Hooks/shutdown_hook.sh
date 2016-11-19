#!/bin/sh
# session hook script; write commands here to execute on the host at the
# specified state

# Borro la entrada en el firewall
/sbin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE

# Apago el servicio Nfsen
/etc/init.d/nfsen stop

# Apago el servicio fprobe
/usr/bin/killall fprobe

# Elimino rutas estaticas
route del -net 193.81.7.0/24 gw 10.0.4.1
route del -net 163.10.251.0/24 gw 10.0.4.1







