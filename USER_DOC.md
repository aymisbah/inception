# User Documentation

## Services Provided

This infrastructure is composed of three services:

* **NGINX**: Provides HTTPS access to the website and forwards PHP requests.
* **WordPress**: Provides the website and its administration interface.
* **MariaDB**: Stores the WordPress database and website data.

The services communicate through a private Docker network.

## Starting the Project

From the project root, run:

```bash
make
```

This builds the Docker images, creates the required network and volumes, and starts all services.

Alternatively:

```bash
docker compose -f srcs/docker-compose.yml up --build
```

## Stopping the Project

To stop the running services:

```bash
make down
```

or:

```bash
docker compose -f srcs/docker-compose.yml down
```

The persistent data stored in Docker volumes is not removed when the containers are stopped.

## Accessing the Website

Once the project is running, access the website through:

```text
https://aymisbah.42.fr
```

The domain must resolve to the Docker host. For local testing, the following entry can be added to `/etc/hosts`:

```text
127.0.0.1    aymisbah.42.fr
```

## Accessing the Administration Panel

The WordPress administration panel is available at:

```text
https://aymisbah.42.fr/wp-admin
```

Use the administrator credentials configured for the WordPress installation.

The administrator account is created during the WordPress initialization process.

## Credentials

Sensitive credentials are stored in the project's `secrets/` directory and are provided to the containers through Docker secrets.

For example:

```text
secrets/
├── db_password
├── db_root_password
└── ...
```

Inside the containers, secrets are available through paths such as:

```text
/run/secrets/db_password
```

Passwords should not be committed to Git or exposed in configuration files.

Non-sensitive configuration values, such as database names and service names, are configured through environment variables.

## Checking the Services

To check whether the containers are running:

```bash
docker ps
```

The NGINX, WordPress, and MariaDB containers should be running.

To check service logs:

```bash
docker compose -f srcs/docker-compose.yml logs
```

To check a specific service:

```bash
docker compose -f srcs/docker-compose.yml logs nginx
docker compose -f srcs/docker-compose.yml logs wordpress
docker compose -f srcs/docker-compose.yml logs mariadb
```

You can also check the Docker network and volumes with:

```bash
docker network ls
docker volume ls
```

If all containers are running and the website is accessible through HTTPS, the infrastructure is operating correctly.

