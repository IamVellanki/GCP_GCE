#!/bin/bash
set -e  # Exit on error

# Install Apache
sudo yum install httpd -y
sudo systemctl enable httpd
sudo systemctl start httpd

# Update Apache to use IPv4
sudo sed -i 's/^Listen 80/#Listen 80/' /etc/httpd/conf/httpd.conf
echo "Listen 0.0.0.0:80" | sudo tee -a /etc/httpd/conf/httpd.conf

# Configure VirtualHost
sudo tee /etc/httpd/conf.d/learnershub.conf > /dev/null <<EOL
<VirtualHost *:80>
    ServerName learnershub.co.in
    DocumentRoot /var/www/html
    <Directory "/var/www/html">
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/httpd/learnershub_error.log
    CustomLog /var/log/httpd/learnershub_access.log combined
</VirtualHost>
EOL

# Create sample HTML page
echo "<h1>Welcome to LearnersHub!</h1>" | sudo tee /var/www/html/index.html

# Open firewall for HTTP traffic
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload

# Restart Apache to apply changes
sudo systemctl restart httpd
