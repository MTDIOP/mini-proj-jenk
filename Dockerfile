#Install from ubuntu image
FROM ubuntu:18.04

# Upgrading
RUN apt-get update -y
RUN apt-get upgrade -y

#Install tools
RUN apt-get install -y net-tools
RUN apt-get install -y inetutils-ping

#Install dependancies
RUN apt-get install -y curl
RUN apt-get install -y nginx

# Copying src code to Container
ADD static-website-example/ /var/www/html/ 

# Exposing Ports
EXPOSE 8080

# Application Environment variables
# Running Python Application
ENTRYPOINT ["/usr/sbin/nginx", "-g", "daemon off;"] 

