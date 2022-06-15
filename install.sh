#!/bin/bash

# instalar php 8.1 y activar
echo instalando php 8.1 y activandolo
sleep 2s
sudo apt install php8.1 -y
sudo a2dismod php8.0
sudo a2enmod php.8.1
sudo systemctl restart apache2

# Instalar composer
echo Instalar Composer debian
sleep 2s
sudo apt install curl php-cli php-mbstring git unzip -y
curl -sS https://getcomposer.org/installer -o composer-setup.php
HASH="$(wget -q -O - https://composer.github.io/installer.sig)"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '$HASH') { echo 'Instalador verificado'; } else { echo 'Instalador corrupto'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer -y

# Instalar npm debian
echo Instalar npm debian
sleep 2s
echo actualizar sistema
sudo apt update && sudo apt upgrade -y
sudo apt install nodejs npm -y
echo exit install nodejs.
sleep 2s

# acceder al proyecto
cd /var/www/
rm -rf html/

# clonar carpeta
git clone https://github.com/Jesus-JAR/time-track.git proyecto
# ir a proyecto
cd /var/www/proyecto

echo segundo install
sleep 3s
# permiso del instalador
sudo chmod +x install.sh

# instalar
sudo ./install.sh
