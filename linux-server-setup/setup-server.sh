#!/bin/bash


echo "Starting Server Setup..."


sudo apt update


sudo apt upgrade -y


# git installation
sudo apt install git -y



# docker installation and setup
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker --no-pager



# install and setup nginx
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx --no-pager



# create a new user
sudo adduser developer



# configure the firewall
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw --force enable
sudo ufw status



# Create Project Directories
mkdir -p ~/Projects
mkdir -p ~/Logs
mkdir -p ~/Backups


# Generate a log file
mkdir -p logs

echo "Setup started at $(date)" > logs/setup.log
echo "Git installed" >> logs/setup.log
echo "Docker installed" >> logs/setup.log
echo "Nginx installed" >> logs/setup.log
echo "Setup completed at $(date)" >> logs/setup.log



