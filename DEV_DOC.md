# Developer Documentation

## Environment Setup

### Prerequisites

The following tools are required:

* Linux environment or virtual machine.
* Docker.
* Docker Compose.
* Make.
* Git.

### Project Structure

```text
.
├── Makefile
├── secrets/
└── srcs/
    ├── docker-compose.yml
    └── requirements/
        ├── nginx/
        ├── wordpress/
        └── mariadb/
```

### Configuration

The project uses environment variables for non-sensitive configuration, such as:

* Domain name.
* Database name.
* Database user.
* Service names.

Sensitive credentials are stored separately in the `secrets/` directory.

Example:

```text
secrets/
├── db_password
├── db_root_password
└── ...
```

These secrets are mounted inside the appropriate containers under:

```text
/run/secrets/
```

Secrets must not be committed to version control.

## Building and Launching

From the project root, run:

```bash
make
```

The Makefile builds the required Docker images and starts the infrastructure using Docker Compose.

The equivalent Docker Compose command is:

```bash
docker compose -f srcs/docker-compose.yml up --build
```

To rebuild the project:

```bash
make re
```

## Managing Containers

To list running containers:

```bash
docker ps
```

To view all containers:

```bash
docker ps -a
```

To view service logs:

```bash
docker compose -f srcs/docker-compose.yml logs
```

To view logs for a specific service:

```bash
docker compose -f srcs/docker-compose.yml logs nginx
docker compose -f srcs/docker-compose.yml logs wordpress
docker compose -f srcs/docker-compose.yml logs mariadb
```

To access a running container:

```bash
docker exec -it <container_name> bash
```

To stop the project:

```bash
make down
```

or:

```bash
docker compose -f srcs/docker-compose.yml down
```

## Managing Volumes

List Docker volumes:

```bash
docker volume ls
```

Inspect a volume:

```bash
docker volume inspect <volume_name>
```

Docker volumes are used to persist data independently from containers.

Avoid removing project volumes unless you intentionally want to delete the persistent application or database data.

## Data Persistence

The project uses Docker volumes to store persistent data.

The main persistent data includes:

* WordPress files and website data.
* MariaDB database files.

Containers can be stopped, removed, and recreated without losing this data as long as the associated Docker volumes are preserved.

The data is managed by Docker and can be inspected using:

```bash
docker volume ls
docker volume inspect <volume_name>
```

The exact physical storage location is managed by Docker and depends on the host system.

## Development Workflow

A typical development workflow is:

```bash
make
```

Check the running services:

```bash
docker ps
```

Check logs when debugging:

```bash
docker compose -f srcs/docker-compose.yml logs <service>
```

After modifying a Dockerfile or configuration:

```bash
make re
```

When finished:

```bash
make down
```

