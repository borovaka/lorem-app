# Lorem Ipsum Demo App

## Demo

https://app.lorem.anchev.eu/

## Services

### PHP

Build from Dockerfile.php Contains a Laravel app that displays the page. Cache headers are set in routes/web.php and can be controlled programtically if its needed.

### Web

Build from Dockerfile.nginx. Nginx container used to serve the requests to PHP-FMP, and add static content cache header.

Config can be seen in "deploy/nginx/vhost.conf"

### Cache

Build from Dockerfile.cache. Nginx cache proxy. This can be used inside the cluster to cache responses from BE, it also can be deployed outisde of the cluster and be used as edge node.

Config can be seen in "deploy/cache/cache.conf"

## Local Run

```bash
$ docker-compose up -d
```

- On port 8080 - traffic is exposed via the proxy.
- On port 8081 - directly call the backend service.

## Helm chart

Located in "deploy/helm/lorem"

```bash
$ helm install $APP_NAME deploy/helm/lorem/ # Installs the app
$ helm show values deploy/helm/lorem/ # Shows variables
```

## Jenkinfile  

Just an example deployment Jenkins pipeline ( Not tested :) )

## Description

The application is separated in two pods - one with PHP-FPM+Nginx ( called backend ), and one Cache proxy.

This give us the abillity to scale different parts of the app separately. For example if we have lots of requests on the same data - we can scale only cache proxy to handle the requests, otherwise if we have heavy MEM/CPU operations on the App - we can scale the application deployment.

Helm chart do not contain Autoscalers, but they can be added separately.
