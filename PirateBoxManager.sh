#!/bin/bash
#
#
#
#                                                                                                     
# _|_|_|_|_|                                                  _|_|_|                _|                
#     _|      _|_|    _|  _|_|  _|  _|_|    _|_|    _|  _|_|  _|    _|  _|    _|  _|_|_|_|    _|_|    
#     _|    _|_|_|_|  _|_|      _|_|      _|    _|  _|_|      _|_|_|    _|    _|    _|      _|_|_|_|  
#     _|    _|        _|        _|        _|    _|  _|        _|    _|  _|    _|    _|      _|        
#     _|      _|_|_|  _|        _|          _|_|    _|        _|_|_|      _|_|_|      _|_|    _|_|_|  
#                                                                             _|                      
#                                                                         _|_|                        
# April 5 2012
#
# Simple script for starting a piratebox on a laptop (eeePC specifically)
#
# By Cale "TerrorByte" Black 
#
# Credit for the original piratebox goes to David Darts
#
# Credit for the wonderful scripts goes to Matthias Strubel
#  
###########################################################################################################################
###########Version 0.6.1###################################################################################################
#Deleted the annoying piratebox comment on the download version
#Cleaned up code and descripors
#Added Devel Comments
#Addressed not being able to access piratebox.lan
#Cleaner Execution
#Changed text editor to Nano for begginer users (sorry VI lovers)
#Tested on a LiveCD / LiveUSB / LiveSD of Ubuntu 10.04 and 10.10 (working on persistance)
###########################################################################################################################
PS3='Please enter your choice: '
options=("Quick install for Debian based systems" "Start PirateBox" "Stop PirateBox" "Just Download the Scripts" "Edit piratebox.conf" "Edit hostapd.conf (SSID, Channel, Driver, etc)" "Quit")

select opt in "${options[@]}"

do
    case $opt in
"Quick install for Debian based systems")
sudo wget -P /tmp/ http://piratebox.aod-rpg.de/dokuwiki/lib/exe/fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz
cd /tmp/
sudo cp -i fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz piratebox-0.3.3-scripts-1.9.tar.gz
sudo rm fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz
sudo tar xzvf piratebox*.tar.gz
cd /tmp/piratebox
sudo cp -rv piratebox /opt
sudo ln -s /opt/piratebox/init.d/piratebox /etc/init.d/piratebox
rm /opt/piratebox/share & ln -s /mountpoint /opt/piratebox/share 
sudo chmod 777 /opt/piratebox/chat/cgi-bin/data.pso
# Add these to lines to /etc/hosts
# Use ed?
#192.168.77.1  piratebox.lan
#192.168.77.1  piratebox
sudo service network-manager stop
sudo killall dhclient
sudo killall dnsmasq
sudo /etc/init.d/piratebox start
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"

;;

"Start PirateBox")
sudo /etc/init.d/piratebox start
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"
;;

"Stop PirateBox")
sudo /etc/init.d/piratebox stop
sudo service network-manager start
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"
;;

"Just Download the Scripts")
sudo wget -P /tmp/ http://piratebox.aod-rpg.de/dokuwiki/lib/exe/fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz
cd /tmp/
sudo cp -i fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz piratebox-0.3.3-scripts-1.9.tar.gz
sudo rm fetch.php?media=piratebox-0.3.3-scripts-1.9.tar.gz
echo ""
echo "Files saved in /tmp"
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"
;;

"Edit piratebox.conf")
nano /opt/piratebox/conf/piratebox.conf
clear
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"
;;

"Edit hostapd.conf (SSID, Channel, Driver, etc)")
nano /opt/piratebox/conf/hostapd.conf
clear
echo ""
echo "1) Quick install for Debian based systems"
echo "2) Start PirateBox"
echo "3) Stop PirateBox"
echo "4) Just Download the Scripts"
echo "5) Edit piratebox.conf"
echo "6) Edit hostapd.conf (SSID, Channel, Driver, etc)"
echo "7) Quit"
;;
###########################################################################################################################
#View Upload folder
#Possible to do real time updates?
#Interface for managing files (may wait until GUI)
###########################################################################################################################
#Add Debugging for:
#No package for dnsmasq and hostapd (Older versions 10.04 and below do not have universe debs active by default, see comments in option 1)
#No network access after taking PirateBox down (use sudo service network-manager stop and than sudo service network-manager start
#No access to chat or viewing uploaded folder (Copy from /opt/piratebox/conf/hosts to /etc/hosts)
#Debug Manual from http://piratebox.aod-rpg.de/dokuwiki/doku.php?id=script-package_for_debian_based_systemes&DokuWiki=93bea71d696f0054de696f11d8acc0e0
###########################################################################################################################
#Add ManPages / Manual
#Quick Manual
#History of PirateBox
#Debug Manual from above
#Help Develope? page
#Art
###########################################################################################################################

"Quit")
clear
break
;;
*) echo invalid option;;

esac
done
###########################################################################################################################
#GUI
#Make out of QT so it can be done quickly.
#Or Java later on for multiple OS?
###########################################################################################################################