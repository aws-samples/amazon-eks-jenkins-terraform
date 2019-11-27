
### To Install Apache Maven and Java 8 on your EC2 instance
<em>https://docs.aws.amazon.com/neptune/latest/userguide/iam-auth-connect-prerq.html</em>

#### Enter the following to add a repository with a Maven package.
```
sudo wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
```
#### Enter the following to set the version number for the packages.
```
sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
```
#### Use yum to install Maven.
```
sudo yum install -y apache-maven
```
#### Enter the following to install Java 8 on your EC2 instance.
```
sudo yum install java-1.8.0-devel
```
#### Enter the following to set Java 8 as the default runtime on your EC2 instance.
```
sudo /usr/sbin/alternatives --config java
```
#### When prompted, enter the number for Java 8.
```
sudo alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
```

#### Enter the following to set Java 8 as the default compiler on your EC2 instance.
```
sudo /usr/sbin/alternatives --config javac
```
#### When prompted, enter the number for Java 8.
```
sudo alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac
```
