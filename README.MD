# Starter WP

A Docker starter instance for WordPress.

## Getting started

Add a `.env` file in the project directory similar to the following.

```
COMPOSE_PROJECT_NAME=eridesign
DOCKER_DEV_DOMAIN=myproject.test
```

`COMPOSE_PROJECT_NAME` is the name of the project for Docker Compose.

`DOCKER_DEV_DOMAIN` is the domain that will be for local dev. Use a `.test` domain.

Once that is all set simply run `docker-compose up` in the project directory and navigate your browser to whatever you set for DOCKER_DEV_DOMAIN. By default this will be `project.test`.
