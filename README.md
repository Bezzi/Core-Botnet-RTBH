# Core-Botnet-RTBH
Emulacion  de un ataque DDoS con Core y Quagga. Mitigación del ataque con RTBH.

## Ataque DNS

Contiene el script "dns_attack.sh". Se lo puede ejecutar desde la consola bash o incluir en el hook de Core para su ejecución automatica al iniciar la topología.

## Configuracion de nodos

Contiene toda las configuracions de cada nodo individual.

## Core Hooks

### Contiene:
1."runtine_hook.sh" Al incorporarse a Core permite autoconfiguraciones al inicio de la topología para el funcionamiento del escenario.
2."shutdown_hook.sh" Al incorpoarse a Core permite deshacer las configuraciones realizadas por runtime_hook.sh al parar la topología. 
SaveRestoreScripts

## BotnetRTBH.imn
Archivo de Core con la topología.

## Comentarios:
Se necesita una maquina virtual con tres interfaces:
### eth0:
Modo NAT - Para el acceso a internet desde la maquina virtual.
### eth1:
Modo red interna - Para recibir NetFlows del fprobe.
### eth2:
Modo red interna - Para que la topología de Core pueda tener acceso a Internet.

*Se necesita instalar las herramientas de Core, Quagga, protocolos de ruteo OSPF, BGP y Nfsen en la maquina virtual. *


