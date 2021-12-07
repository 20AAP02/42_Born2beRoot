Born2beRoot

Mandatory Goals:
Create Vritual Machine
Setup Debian OS in the VM
Install minimum of services
AppArmor needs to be running at startup
You must create at least 2 encrypted partitions using LVM
During defense you’ll be asked a few questions about the operating system you choose.
(Ex: Whats the differences between aptitude and apt, or what AppArmor is?)
A SSH service will be running on port 4242 only (for security reasons, it must not b possible to connect using SSH as root)
The use of SSH will be tested during the defense by setting up a new account
You have to configure your operating system with the UFW firewall and thus leave only port 4242 open
Your firewall must be active when you launch your virtual machine
The hostname of your virtual machine must be your login ending with 42
you’ll have to modify this hostname during evaluation
Implemnt strong password policy
Install and configure sudo following strict rules
In addition to the root user, a user with your login as username has to be present
This user has to belong to the user42 and sudo groups
During deffense, you will have to create a new user and assign it to a group
To setup a strong password policy
Password has to expire every 30 days
The minimum number of days allowed before modification of a password will be se to 2
The user has to receive a warning message 7 days before their password expires
Password must be at least 10 characters ong, it must contain an uppercase letter and a number. Also it must not contain more than 3 consecutive identical characters
Password must not include the name of the user
The following rule does not apply to the root password
Password must have at least 7 characters that are not part of the former password
After setting up your configuration files, you will have to change all the passwords of the accounts present on the virtual machine, including root account
to set up a strong configuration for your sudo group, you have to comply with this requirements
Authetication using sudo has to be limited to 3 attempts in the event of an incorrect password
A custom message of your choice has to be displayed if an error due to a wrong password occurs when using sudo
each action using sudo has to be archived, both inputs and outputs. The log file has to be saved in the /var/log/sudo/ folder
The TTY mode has to be enabled for security reasons
For security reasons too, the paths that can be used by sudo must be restricted
(Ex: /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/snap/bin)
Finally, you have to creat a simple script called monitoring.sh. It must be developed in bash
At server startup, the script will display some information (listed below) on all terminals every 10 minutes (take a look at wall). The banner is optional. No error must be visible
The architecture of your operating system and its kernel
The number of physical processors
The number of virtual processors
The current available RAM on your server and its utilization rate as a percentage
The current available memory on your server and its utilization rate as a percentage
The current utilization rate of your processors as a percentage
The date and time of the last reboot
Whether LVM is active or not
The number of active connections
The number of users using the server
The IPv4 address of your server and its MAC (Media Access Control) address
The number of commands executed with the sudo program
During defense, you will be asked to explain how this script works. You will also have to interrupt it without modifying it. (Take a lokk at cron)

Bonus Goals:

Set up partitions correctly so you get a structure similar to the one showed in the subject page 11
Set up a function WordPress website with the following services: lighted, MariaDB, and PHP
Set up a service of your choice hat you think is useful (NGINX / Apache2 excludedDuring defense, you will have to justify your choice
To complete the bonus part, you have the possibility to set up extra services. In this case, you may open more ports to suit your needs. Of course, the UFW rules has to be adapted accordingly.
