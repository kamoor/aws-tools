#!/bin/bash   

if [ "$1" == "" ]; then
	echo "pass domain name (example.com) as first paramter"
	exit
fi

SITE=$1

sudo apt-get update
sudo apt-get install apache2
echo "Apache installed."
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt
sudo apt-get install php5-mysql
sudo apt-get install php5-cli

#Install Apahce SO
sudo a2enmod rewrite
sudo a2enmod headers

sudo service apache2 restart
echo "PHP Installed. You can install more modules using sudo apt-get install package1 package2"
echo "Default apache home location will be /var/www/html/"

#Setup Site Dir
sudo mkdir /var/sites/$SITE/
sudo chown -R ubuntu:ubuntu /var/sites/$SITE/
sudo chmod -R 755 /var/sites/$SITE/

sudo mkdir /var/log/$SITE/
sudo chown -R ubuntu:ubuntu /var/log/$SITE/
sudo chmod -R 755 /var/log/$SITE/

#Setup conf

cat ./server-setup-virtual-host.conf | sed -e "s/example.com/$SITE/" >> $SITE.conf
cat ./server-setup-index.html | sed -e "s/example.com/$SITE/" >> index.html

sudo cp ./$SITE.conf /etc/apache2/sites-enabled/
sudo cp ./index.html /var/sites/$SITE/index.html

sudo rm $SITE.conf
sudo rm index.html


sudo service apache2 restart
echo "$SITE home folder created /var/sites/$SITE/"
echo "$SITE log folder created at /var/log/$SITE/"


