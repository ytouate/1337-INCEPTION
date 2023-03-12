# 1337 Inception

> The main objective of this project was to expand my knowledge in Docker, networking, and system administration. Through this project, I was able to gain hands-on experience with these technologies and learn how to deploy and manage complex applications in a distributed environment.

## Table of Contents

* General Information
* Technologies Used
* Key Learnings
* Setup
* Acknowledgements

## General Information
I used Docker and Docker Compose to set up the following containers:

* MariaDB - A free and open-source relational database management system that stores the WordPress data
* WordPress - A free and open-source content management system that powers the website
* Nginx - A high-performance web server that serves as a reverse proxy to the WordPress container

Additionally, I implemented a bonus part of the project that included the following services - each in their dedicated container:

* FTP server - A server that enables file transfer between the server and the client
* Redis cache - A caching mechanism that stores frequently accessed data in memory to improve performance
* Ctop - A command-line tool that provides real-time metrics for Docker containers
* Adminer - A database management tool that enables the user to manage the MariaDB container
* Static website - A website that serves my resume

## Technologies Used
* Docker
* Docker Compose
* DevOps principles

## Key Learnings
* How to create and manage complex applications in a distributed environment
* How to utilize Docker networking to ensure seamless communication between containers
* How to deploy and manage a variety of different services in a containerized environment
* How to work with configuration files to customize the environment to suit specific needs
* How to apply DevOps principles to ensure efficient collaboration and delivery of software solutions

## Setup Instructions
* Clone the repository
* RUN <code>make</code>
* go to https://localhost:443 to see the wordpress page
* http://localhost:82 to see the static website
* RUN <code>ftp [the ip address of the ftp container] 21 </code> to use ftp

## Acknowledgements

<a href="https://github.com/otmallah">Othman Mallah</a>
<br>
<a href="https://github.com/ilyasslefhaili">Ilyass Lefhaili</a>
