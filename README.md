# Project Purpose

This project aims to broaden your knowledge of sysadmin by using Docker. To create Docker images inside a virtual Machine.

# What is inception?

This project consists in setting up a infrastructure with diferent services. The infrastructure is based on 3 containers for the mandatory part, all of them should be built with Debian Buster or the penultimate stable version of Alpine linux. 

# Overview of the containers:

* Nginx Container - Basically, nginx is a web server, which can be used as a reverse proxy, http cache and load balencer. Nginx was designed to serve multiple requests and low memory with efficiency. Instead of creating new process for each request on the web, it uses a asynchronous way so it can handle multiple clients without blocking the others clients.

* Php-fpm + Wordpress Container - To understand what is php-fpm, we have to understand what CGI (Common Gateway interface) is. Cgi is a protocol that defines a way for a HTTP server interact with external applications. CGI improves the web server capabilities to enable dynamic content. 


Once configured and the service is active, it will listen to a port that is specified on the configuration file (located at /etc/nginx/nging.conf or inside /etc/nginx/sites-enabled/* if you want o )

One with Nginx, another with php-fpm and Wordpress installed, and the last one with mariadb. This three containers must be able to comunicate with 

# Overview of the tecnologies used:

https://help.superhosting.bg/en/cgi-common-gateway-interface-fastcgi.html
https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831548(v=ws.11)?redirectedfrom=MSDN
https://pt.stackoverflow.com/questions/207464/como-funciona-o-php-fpm
https://www.plesk.com/blog/various/why-do-you-need-php-fpm/