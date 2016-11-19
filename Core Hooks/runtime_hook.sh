#!/bin/sh
# session hook script; write commands here to execute on the host at the
# specified state 

# Puente entre VM e Internet
BReth2=`brctl show | grep -w eth2 | cut -f1`

# Puente con router de Syper-Borde para Nfsen
# Identificador de Syper-Borde: veth2.0 (eth0 de veth2)
#nfsen=$(brctl show | grep -w "veth2.0.*" | cut -f1)

# Puente con eth1
BReth1=$(brctl show | grep -w  eth1 | cut -f1)

# Completo la tabla de ruteo de la VM para que alcance las rutas de la topologia.
ifconfig "$BReth1" 10.0.3.2 netmask 255.255.255.0
ifconfig "$BReth2" 10.0.4.2 netmask 255.255.255.0
route add -net 193.81.7.0/24 gw 10.0.4.1
route add -net 163.10.251.0/24 gw 10.0.4.1

# Inicio el servicio Nfsen
/etc/init.d/nfsen start

# Enmascaro las direcciones IP para que la topologia salga a Internet.
/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

core_path=$(ps aux | grep -oP "/tmp/pycore.[0-9]+" | head -n 1)
cd $core_path

# Envio de NetFlows para Nfcapd a la VM.
# NetFlow de trafico saliente
vcmd -c Syper-Borde -- fprobe -ieth0 -f'ip and src net 193.81.7.0/24' 10.0.3.2:5555
# NetFlow de trafico entrante
vcmd -c Syper-Borde -- fprobe -ieth0 -f'ip and dst net 193.81.7.0/24' 10.0.3.2:5556


