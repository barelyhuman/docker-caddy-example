# docker caddy simple

Simple self hosting setups to be able to provision services and map domains to them in an easier fashion.

If you prefer traefik over caddy, you can go through [this template](https://github.com/barelyhuman/easy-deploy-template) instead

## Why

There's numerous ways to self host and I keep trying ways to make sure I can manage the server and apps even if I pick them up months later. This is one of many such setups that work well but aren't openly shared across.

## Usage

### Setup network

```sh
; docker create network caddy_network # create a shareable network
```

We create a docker shared network for all the services to talk to each other on. This allows us to configure the `Caddyfile` in a way that allows using service names with unpublished ports without worrying about filling up the ports on the system.

### Add in the needed services

```yaml
// docker-compose.example-service.yml
services:
    //... existing
    example_app:
        image: hello-world:latest
    networks:
        caddy_network:

networks:
    caddy_network:
        external: true

```

The important part here is to add in the `networks` definition both on the service and the global context of this docker file. Marking it as `external` lets docker compose know that it doesn't have to create another network for this service and to use an existing network.

### Actions

You can now start the services, make sure to edit the `Makefile` to include your newly added docker-compose file

```sh
;make start
;make stop
;make restart
;make reset
```
