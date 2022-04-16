#!/bin/bash

# sudo yum -y update && sudo yum remove -y java

# echo "Install Java JDK 8"
# sudo amazon-linux-extras install java-openjdk11 -y
# sleep 10s

echo "Install Maven Git Docker"
sudo yum update -y && sudo yum install -y maven git docker
sleep 10s

# echo "Add Jenkins to docker users"
# 
# sleep 10s

# echo "Install Jenkins"
# sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo && sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
# sudo yum upgrade && sudo yum install jenkins -y && sudo usermod -a -G docker jenkins && sudo systemctl enable jenkins && sudo systemctl start jenkins && sudo systemctl status jenkins

sudo yum install -y jenkins java-11-openjdk-devel
sudo yum -y install wget
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins -y
sudo usermod -a -G docker jenkins && sudo systemctl start docker && sudo systemctl enable docker && sudo systemctl start jenkins