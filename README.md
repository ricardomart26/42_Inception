# Project Purpose

This project aims to broaden your knowledge of sysadmin by using Docker. To create Docker images inside a virtual Machine.

# What is inception?

This project consists in setting up a infrastructure with diferent services. The infrastructure is based on 3 containers for the mandatory part, all of them should be built in Debian Buster or the penultimate stable version of Alpine linux. It should all be conected like this diagram:

![Alt text](ReadmeImgs/ProjectDiagram.png?raw=true "Project Diagram")

# Overview of the tecnologies used:

## FastCGI (Common Gateway Interface)
<!-- https://help.superhosting.bg/en/cgi-common-gateway-interface-fastcgi.html -->
Cgi is a protocol that defines a way for a HTTP server interact with external applications (this applications are called Cgi Scripts). CGI improves the web server capabilities to enable dynamic content.

For a long time, the world wide web first web servers provided pages containing pre-written HTML code, which meant that the content could not change (static websites).

With Cgi, the web server does not respond with an existing HTML file, but executes a application where it receives the HTTP request data and returns the output to the web server. Only then the server returns a response to the request while forwarding the generated HTML code.

FastCGI is an improved CGI version, is a high performance version of the CGI technology with enhanced capabilities.

### Some differences from FastCgi and Cgi:

![Alt text](ReadmeImgs/cgi.webp?raw=true "Cgi Description") ![Alt text](ReadmeImgs/Fastcgi.webp?raw=true "FastCgi Description")


Cgi runs an application which processes every HTTP request. After the application finishes processing and returns the ouput data, Cgi terminates the application process. When it gets another request, it runs the application and generates the output.
Everytime it runs the application it might use more time and resources than generating the ouput data itself.
The more processes are running the more resources such as RAM or computing power will be exploited. The webpage loading time is now defined by the server load and application load time.

FastCgi keeps the process "alive" even after finishing processing and returning the ouput data the process still hangs... (ACABAR)


# Docker 

Docker is a software to create, deploy and manage virtualized application containers on a common operating system (OS). A container packages the application service or function with all of the libraries, configuration files, dependecies and other necessary parts and parametes to operate. Each container shares the services of one underlying operating system.
Docker uses resource isolation in the OS kernel to run multiple containers on the same OS. This is different than virtual machines, which encapsulates an entire OS with executable code on top of an abstracted layer of physical hardware resources.

Docker Engine is the underlying technology that creates a server-side daemon process that hosts images, containers, networks and storage volumes.
The daemon also provides a client-side command line interface (CLI) for users to interact with the daemon through the Docker interface. Containers created by docker are called dockerfiles.

Docker allows a portability so the users can share containers over various hosts in private and public environments. Docker has efficient application development, lower resource use and faster deployment compared to VMs.

### Vm vs Docker

![Alt text](ReadmeImgs/vm_versus_docker.jpg?raw=true "Cgi Description")

## Docker CLI Commands 

docker build .
docker ps -a

https://help.superhosting.bg/en/cgi-common-gateway-interface-fastcgi.html
https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/hh831548(v=ws.11)?redirectedfrom=MSDN

## php-fpm
https://pt.stackoverflow.com/questions/207464/como-funciona-o-php-fpm
https://www.plesk.com/blog/various/why-do-you-need-php-fpm/

# Overview of the services inside the containers:

* Nginx Container - Basically, nginx is a web server, which can be used as a reverse proxy, http cache and load balencer. Nginx was designed to serve multiple requests and low memory with efficiency. Instead of creating new process for each request on the web, it uses a asynchronous way so it can handle multiple clients without blocking the others clients.

* Php-fpm + Wordpress Container - To understand what is php-fpm, we have to understand what CGI (Common Gateway interface) is. Cgi is a protocol that defines a way for a HTTP server interact with external applications. CGI improves the web server capabilities to enable dynamic content. 


Once configured and the service is active, it will listen to a port that is specified on the configuration file (located at /etc/nginx/nging.conf or inside /etc/nginx/sites-enabled/* if you want o )

One with Nginx, another with php-fpm and Wordpress installed, and the last one with mariadb. This three containers must be able to comunicate with 

