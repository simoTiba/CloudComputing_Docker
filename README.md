# CloudComputing_Docker

Composition with Docker of Cloud SaaS, PaaS, and IaaS services

## Part 1: Creating an Apache Docker image

“ RUN apt-get -y install apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
EXPOSE 80
CMD /usr/sbi “ 

## Part 2: Push images to Docker Cloud
```
⋅⋅* docker tag my_image $DOCKER_ID_USER/my_image.
⋅⋅* docker push $DOCKER_ID_USER/
```


Link: [mohamedtiba/apache](https://hub.docker.com/r/mohamedtiba/apache/)

Launch:
```
sudo docker run -d -p 8080:80 simo/apache
```

## Part 3: Creating a Docker image deploying a given web application on an apache server

create a new docker image that deploys your web application in an Apache server.

Once the order ID is retrieved, log in to the container by running the following command:
```

sudo docker exec -it dba31845d2ba bash # dba31845d2ba Container ID
```

To deploy a web application to your container, go to the var / www / html directory of your container by running the command:

cd var / www / html

create a new directory for your application by running the command:

sudo mkdir mywebapp

Then upload the html files of your application into the create directory.
To test the  application:

http: // localhost: 8080 / mywebapp

Link:  [mohamedtiba/mywebapp](https://hub.docker.com/r/mohamedtiba/mywebapp/)

## Part4:How to use this image

Start a mysql server instance
Starting a MySQL instance is simple:
```

$ docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d simo/mysql:latest
```


... where some-mysql is the name you want to assign to your container, my-secret-pw is the password to be set for the MySQL root user.

Connect to MySQL from an application in another Docker container
This image exposes the standard MySQL port (3306), so container linking makes the MySQL instance available to other application containers. Start your application container like this in order to link it to the MySQL container:
```

$ docker run --name some-app --link some-mysql:mysql -d simo/webapp
```

Connect to MySQL from the MySQL command line client
The following command starts another mysql container instance and runs the mysql command line client against your original mysql container, allowing you to execute SQL statements against your database instance:
```

$ docker run -it --link some-mysql:mysql --rm simo/mysql:latest sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
```

... where some-mysql is the name of your original mysql container.

This image can also be used as a client for non-Docker or remote MySQL instances:
```

$ docker run -it --rm mysql mysql -hsome.mysql.host -usome-mysql-user -p
```

More information about the MySQL command line client can be found in the MySQL documentation

Link: [mohamedtiba/mysql](https://hub.docker.com/r/mohamedtiba/mysql/)
