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
a2enmod proxy_http
a2enmod proxy_ajp
a2enmod rewrite
a2enmod deflate
a2enmod headers
a2enmod proxy_balancer
a2enmod lbmethod_byrequests
a2enmod proxy_connect
a2enmod proxy_html
a2enmod xml2enc

a2dissite default
ufw allow in "Apache Full"

#Launch the site
cd "/var/www/resume-site/Resume Site"
ln -s "/var/www/resume-site/Resume Site" /etc/apache2/sites-available
#cp resume-site.conf /etc/apache2/sites-available/resume-site.conf

a2ensite resume-site.conf
service apache2 restart

dotnet build
dotnet run