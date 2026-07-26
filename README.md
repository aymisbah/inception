This project has been created as part of the 42 curriculum by <aymisbah>

Inception
Description

Inception is a system administration project focused on Docker and containerized infrastructure.

The goal is to build a small infrastructure composed of three services:

NGINX: The web server and HTTPS entry point.
WordPress + PHP-FPM: The application layer.
MariaDB: The database server.

Each service runs in its own container. Docker Compose is used to build, configure, network, and manage the infrastructure.

The main design choices are:

One service per container.
A custom Dockerfile for each service.
A dedicated Docker bridge network for communication between containers.
Docker volumes for persistent data.
Docker secrets for sensitive credentials.
Environment variables for non-sensitive configuration.
Architecture
        HTTPS
          │
          ▼
       NGINX
          │
       FastCGI
          ▼
     WordPress
          │
       MySQL
          ▼
      MariaDB
Docker and Project Sources

Docker provides isolated environments for NGINX, WordPress, and MariaDB while allowing them to communicate through a private network.

The project includes:

Dockerfiles.
Docker Compose configuration.
NGINX configuration.
WordPress initialization scripts.
MariaDB initialization scripts.
TLS certificates.
Docker secrets.
Persistent Docker volumes.
Virtual Machines vs Docker

A virtual machine runs a complete operating system on top of a hypervisor. Docker containers share the host kernel and isolate processes using Linux features such as namespaces and cgroups.

Docker containers are generally lighter and faster to start, while virtual machines provide stronger isolation and can run completely different operating systems.

For this project, Docker is suitable because each service can be isolated without requiring a complete operating system for every service.

Secrets vs Environment Variables

Environment variables are used for general configuration such as database names, usernames, and hostnames.

Docker secrets are used for sensitive information such as passwords. Secrets are mounted inside the container as files, for example:

/run/secrets/db_password

This reduces the exposure of sensitive credentials compared to storing them directly in environment variables.

Docker Network vs Host Network

The project uses a dedicated Docker bridge network.

Containers communicate using service names such as:

wordpress
mariadb

Docker provides network isolation and internal service discovery.

With host networking, a container shares the host's network directly. This provides less network isolation and can cause port conflicts.

Docker Volumes vs Bind Mounts

Docker volumes are managed by Docker and are used in this project to persist WordPress and MariaDB data beyond the lifetime of individual containers.

Bind mounts directly connect a specific host path to a container path. They are more tightly coupled to the host filesystem.

Docker volumes are used here because they provide better separation between the infrastructure and the host filesystem.

Instructions
Requirements
Docker
Docker Compose
Make
Build and Start

From the project root:

make

or:

docker compose -f srcs/docker-compose.yml up --build
Stop the Infrastructure
make down

or:

docker compose -f srcs/docker-compose.yml down
Rebuild
make re

The website can be accessed through:

https://aymisbah.42.fr

The domain must resolve to the Docker host, for example through /etc/hosts.

Resources
Documentation
Docker documentation.
Docker Compose documentation.
Docker networking and volumes documentation.
NGINX documentation.
PHP-FPM documentation.
WordPress and WP-CLI documentation.
MariaDB documentation.
AI Usage

AI was used as a learning and debugging assistant during the project.

It helped with:

Understanding Docker architecture, networking, volumes, and secrets.
Understanding the relationship between Docker Engine, containerd, containerd-shim, and runc.
Debugging NGINX, WordPress, PHP-FPM, and MariaDB configuration issues.
Reviewing Dockerfiles, Compose files, shell scripts, and configuration files.

The implementation, configuration, testing, and final decisions were performed by the project author.

Project Structure
.
├── Makefile
├── secrets/
└── srcs/
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/
        ├── wordpress/
        └── mariadb/
