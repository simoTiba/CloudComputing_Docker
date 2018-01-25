from mohamedtiba/apache:latest

RUN apt-get -y install git
RUN mkdir /var/www/html/mywebapp


RUN git clone https://github.com/yehiataher/microservice-tutorial.git /var/www/html/mywebapp


