# Spring PetClinic Sample Application [![Build Status](https://travis-ci.org/spring-projects/spring-petclinic.png?branch=master)](https://travis-ci.org/spring-projects/spring-petclinic/)

## Understanding the Spring Petclinic application with a few diagrams


## Running petclinic locally
Petclinic is a [Spring Boot](https://spring.io/guides/gs/spring-boot) application built using [Maven](https://spring.io/guides/gs/maven/). You can build a jar file and run it from the command line:


```
git clone https://github.com/spring-projects/spring-petclinic.git
cd spring-petclinic
./mvnw package
java -jar target/*.jar
```

You can then access petclinic here: http://localhost:8080/

<img width="1042" alt="petclinic-screenshot" src="https://cloud.githubusercontent.com/assets/838318/19727082/2aee6d6c-9b8e-11e6-81fe-e889a5ddfded.png">

Or you can run it from Maven directly using the Spring Boot Maven plugin. If you do this it will pick up changes that you make in the project immediately (changes to Java source files require a compile as well - most people use an IDE for this):

```
./mvnw spring-boot:run
```

## In case you find a bug/suggested improvement for Spring Petclinic
Our issue tracker is available here: https://github.com/spring-projects/spring-petclinic/issues


## Database configuration

In its default configuration, Petclinic uses an in-memory database (HSQLDB) which
gets populated at startup with data. A similar setup is provided for MySql in case a persistent database configuration is needed.
Note that whenever the database type is changed, the app needs to be run with a different profile: `spring.profiles.active=mysql` for MySql.

You could start MySql locally with whatever installer works for your OS, or with docker:

```
docker run -e MYSQL_ROOT_PASSWORD=petclinic -e MYSQL_DATABASE=petclinic -p 3306:3306 mysql:5.7.8
docker exec -it mysql bash
mysql -uroot -p

Create the DB schema and the database tables by running the scirpts inside the initDB.sql and populateDB.sql files

Create a jar file under target directory:

mvn package -DskipTests=true

Run the application using mysql profile

java -Dspring.profiles.active=mysql -jar target\spring-petclinic-2.0.0.jar

Run the application using hsqldb profile

java -Dspring.profiles.active=hsqldb -jar target\spring-petclinic-2.0.0.jar
```

## Running Petclinic using Docker

Inside the Dockerfile, create the last line as:

ENTRYPOINT [ "sh", "-c", "java -Dspring.profiles.active=${ENV} -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

Create a docker image and push it to the Docker Hub

And while running the docker:

```
docker run --env ENV=mysql -d -p 8080:8080 <image id> 
```
This way, environment variable gets local as value and passes to Dockerfile when we bring up a container.

You can also pass on the Spring Profile as an environment variable at the run time as:

```
$ docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t ibuchh/spring-petclinic
```

## Petclinic environment variables

```
https://stackoverflow.com/questions/51655725/how-can-i-set-spring-boot-properties-from-docker-run-command?noredirect=1&lq=1

http://www.littlebigextra.com/use-spring-profiles-docker-containers/

https://www.mkyong.com/spring-boot/spring-boot-profile-based-properties-and-yaml-example/

https://dzone.com/articles/spring-boot-profiles-1
```

## Working with Petclinic in your IDE

### Prerequisites
The following items should be installed in your system:
* Java 8 or newer.
* git command line tool (https://help.github.com/articles/set-up-git)
* Your prefered IDE 
  * Eclipse with the m2e plugin. Note: when m2e is available, there is an m2 icon in Help -> About dialog. If m2e is not there, just follow the install process here: http://www.eclipse.org/m2e/
  * [Spring Tools Suite](https://spring.io/tools) (STS)
  * IntelliJ IDEA

### Steps:

<ul>
1. On the command line
```
git clone https://github.com/spring-projects/spring-petclinic.git
```

2) Inside Eclipse or STS
```
File -> Import -> Maven -> Existing Maven project
```

Then either build on the command line `./mvnw generate-resources` or using the Eclipse launcher (right click on project and `Run As -> Maven install`) to generate the css. Run the application main method by right clicking on it and choosing `Run As -> Java Application`.

3) Inside IntelliJ IDEA

In the main menu, choose `File -> Open` and select the Petclinic [pom.xml](pom.xml). Click on the `Open` button.

CSS files are generated from the Maven build. You can either build them on the command line `./mvnw generate-resources`
or right click on the `spring-petclinic` project then `Maven -> Generates sources and Update Folders`.

A run configuration named `PetClinicApplication` should have been created for you if you're using a recent Ultimate
version. Otherwise, run the application by right clicking on the `PetClinicApplication` main class and choosing
`Run 'PetClinicApplication'`.

4) Navigate to Petclinic

Visit [http://localhost:8080](http://localhost:8080) in your browser.
</ul>
