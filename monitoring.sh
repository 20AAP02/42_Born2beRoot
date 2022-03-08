#!/bin/bash
architecture=$(uname -a)
cpuphysical=$(nproc)
vcpu=$(nproc)
memoryusage=$()
diskusage=$()
cpuload=$()
lastboot=$(who -b | awk '{print $3, $4}')
lvmuse=$(lsblk | grep "lvm" | wc -l | awk '{if ($1) {print "yes";exit;} else {print "no"} }')
connexionstcp=$(printf "$(netstat -n | grep "tcp" | wc -l) ESTABLISHED")
userlog=$(echo "$(w | wc -l) - 2" | bc)
network=$(printf "IP $(ip a | grep "scope global" | awk '{print $2}' | cut -c 1-9) ($(ip link | grep link/ether | awk '{print $2}'))")
sudo=$(printf "$(echo "$(sudo cat /var/log/sudo/sudo.log | wc -l) / 2" | bc) cmd")
printf "
\t#Architecture: $architecture\n\
\t#CPU physical : $cpuphysical\n\
\t#vCPU : $vcpu\n\
\t#Memory Usage: $memoryusage\n\
\t#Disk Usage: $diskusage\n\
\t#CPU load: $cpuload\n\
\t#Last boot: $lastboot\n\
\t#LVM use: $lvmuse\n\
\t#Connexions TCP : $connexionstcp\n\
\t#User log: $userlog\n\
\t#Network: $network\n\
\t#Sudo : $sudo\n\
"\
| wall
