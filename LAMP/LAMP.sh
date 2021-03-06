#!/bin/bash
# Author: Philip J. Kazanjian * Boston MA * 11/08/2020 *

sudo apt-get install apache2 -y
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password P@ssw0rd'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password P@ssw0rd'
sudo apt-get install libapache2-mod-auth-mysql php5-mysql mysql-server -y
mysql --user=root --password=P@ssw0rd < /usr/local/bin/sql.txt
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/dbconfig-install boolean true"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/app-password-confirm password P@ssw0rd"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/admin-pass password P@ssw0rd"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/mysql/app-pass password P@ssw0rd"
sudo debconf-set-selections <<< "phpmyadmin phpmyadmin/reconfigure-webserver multiselect apache2"
sudo apt-get install php5 libapache2-mod-php5 phpmyadmin -y

# EOF
