#Simple Script to get arch linux to use OpenRC, Gentoo's init system, and get rid of Systemd run script as root
#Taken from http://systemd-free.org/install.php 
#Add repo
echo -e "[openrc-eudev]\nSigLevel=PackageOptional\nServer=http://downloads.sourceforge.net/project/archopenrc/\$repo/\$arch" >> /etc/pacman.conf

#Remove Systemd
pacman -Add systemd libsystemd

#Install OpenRC

pacman -Sy sysvinit openrc-core eudev eudev-openrc eudev-systemdcompat dbus-nosystemd procps-ng-nosystemd syslog-ng-nosystemd

#Basic Config(Change this too your text editor 


vim /etc/rc.conf; vim /etc/conf.d/xdm; rc-update add xdm default
rm -f /etc/hostname; echo "hostname="`hostname` >| /etc/conf.d/hostname

#Reboot
sysctl kernel.sysrq=1

echo "If above pacman operations reported no errors"
echo "then sync ' remount'o ' reboot:"
echo s >| /proc/sysrq-trigger
echo u >| /proc/sysrq-trigger
echo b >| /proc/sysrq-trigger
