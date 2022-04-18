#!/bin/bash

echo "Install Maven Git Docker"
sudo yum update -y && sudo yum install -y maven git docker
sleep 10s

sudo yum remove -y java
sudo yum remove -y java-17-amazon-corretto-headless.x86_64
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo usermod -a -G docker jenkins && sudo systemctl start docker && sudo systemctl enable docker && sudo systemctl start jenkins