#!/usr/bin/env bash

#Register the Microsoft key, register the product repository, and install required dependencies. 
wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

#Update the products available for installation, then install the .NET SDK
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-2.1.200

#Setup appache
apt-get install -y apache2
a2enmod proxy
ufw allow in "Apache Full"

service apache2 restart
cd "/var/www/resume-site/Resume Site"
a2ensite resume-site.conf

dotnet build
dotnet run