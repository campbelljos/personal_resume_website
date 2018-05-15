# $1 = OAUTH_TOKEN

#Register the Microsoft key, register the product repository, and install required dependencies. 
wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb

#Update the products available for installation, then install the .NET SDK
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install dotnet-sdk-2.1.200

#Clone the site from the repository using passed OAUTH_TOKEN
git clone https://$1:x-oauth-basic@github.com/campbelljos/personal_resume_website.git joe-resume-site
cd "joe-resume-site/Resume Site"

#Setup appache
apt-get install apache2
a2enmod proxy
ufw allow in "Apache Full"

service apache2 restart
a2ensite resume-site.conf


dotnet build
dotnet run