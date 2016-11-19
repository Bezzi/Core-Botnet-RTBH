#!bin/bash

core_path=$(ps aux | grep -oP "/tmp/pycore.[0-9]+" | head -n 1)

cd $core_path


for i in 9 10 11 12 13 14 15 16 17 18
do	
	cp /sbin/cert/data/query_google_spoofed.pcap $core_path"/n"$i".conf"
	vcmd -c n$i -- bittwist /sbin/cert/data/query_google_spoofed.pcap -l 0 -i eth0 -m 0 -r 100 >/dev/null 2>&1 &
done



