#!/bin/bash
sudo yum -y update

echo "Install Java JDK 8"
yum remove -y java
sudo amazon-linux-extras install java-openjdk11 -y

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

echo "Install Docker engine"
yum update -y
yum install docker -y
#sudo usermod -a -G docker jenkins
sudo systemctl start docker
sudo systemctl enable docker

echo "Install Jenkins"
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade
sudo yum install jenkins -y
sudo usermod -a -G docker jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins