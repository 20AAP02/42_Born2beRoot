#!/bin/bash
architecture=$(uname -a)
cpuphysical=$(grep "physical id" /proc/cpuinfo | wc -l)
vcpu=$(nproc)
availableram=$(echo "$(echo "$(free | grep Mem | awk '{print $4}') / 1000" | bc)/$(echo "$(free | grep Mem | awk '{print $2}') / 1000" | bc)MB")
utilizationrate=$(echo "scale=2; $(free | grep Mem | awk '{print $3}') * 100 / $(free | grep Mem | awk '{print $2}')" | bc)
memoryusage=$(echo "$availableram ($utilizationrate%%)")
availablemem=$(echo "$(echo "$(df -H | grep root | awk '{print $4}') * 1000" | bc | cut -c 1-4)/$(df -H | grep root | awk '{print $2}')b")
diskusage=$(echo "$availablemem ($(df -H | grep root | awk '{print $5}' | cut -c 1-2)%%)")
cpuload=$(top -bn1 | grep '^%Cpu' | awk '{printf("%.1f"), $2}')
lastboot=$(who -b | awk '{print $3, $4}')
lvmuse=$(lsblk | grep "lvm" | wc -l | awk '{if ($1) {print "yes";exit;} else {print "no"} }')
connexionstcp=$(printf "$(netstat -n | grep "tcp" | wc -l) ESTABLISHED")
userlog=$(echo "$(w | wc -l) - 2" | bc)
network=$(printf "IP $(ip a | grep "scope global" | awk '{print $2}' | cut -c 1-9) ($(ip link | grep link/ether | awk '{print $2}'))")
sudo=$(printf "$(echo "$(cat /var/log/sudo/sudo.log | wc -l) / 2" | bc) cmd")

printf "
\t#Architecture: $architecture\n\
\t#CPU physical : $cpuphysical\n\
\t#vCPU : $vcpu\n\
\t#Memory Usage: $memoryusage\n\
\t#Disk Usage: $diskusage\n\
\t#CPU load: $cpuload%%\n\
\t#Last boot: $lastboot\n\
\t#LVM use: $lvmuse\n\
\t#Connexions TCP : $connexionstcp\n\
\t#User log: $userlog\n\
\t#Network: $network\n\
\t#Sudo : $sudo\n\
"\
| wall
