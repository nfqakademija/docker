Docker containers for Symfony Kickstart
=======================================

Extracting docker related code:
 * To extract scripts with complex operations (xDebug, prod environment, auto-install)
 * To create more convenient versions for dev/prod
 * To create version with preconfigured xDebug with PHPStorm
 * To use same docker infrastructure for fresh/demo Symfony project
 * To setup project in parallel (for lecturers to check homework faster)

Docker containers
-----------------

[Nginx server](nginx/Dockerfile):
```
docker pull nfqakademija/docker:nginx-latest
```

[PHP runtime](php/Dockerfile):
```
docker pull nfqakademija/docker:php-latest
```

[MySql database](mysql/Dockerfile):
```
docker pull nfqakademija/docker:mysql-latest
```

[node.js for Frontend development](frontend/Dockerfile):
```
docker pull nfqakademija/docker:frontend-latest
```

See [`docker-compose.yml`](docker-compose.yml) and [`docker-compose-tools.yml`](docker-compose-tools.yml) as examples

Usage
-----

Build and start containers:
```bash
docker-compose up -d
```

Test backend:
Open in the browser: [http://127.0.0.1:8000/test.php](http://127.0.0.1:8000/test.php)

Test frontend:
```bash
docker-compose -f docker-compose-tools.yml run frontend.symfony yarn --version
```

Cleanup
-------

Remove running containers:
```bash
docker-compose -f docker-compose.yml kill
docker-compose -f docker-compose-tools.yml kill
```

Remove locally cached files:
```bash
sudo rm -Rf .docker/*
```

Links
-----
 
 * [Install docker](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
 * [Install docker-compose](https://docs.docker.com/compose/install/)
 * [Symfony KickStart project](https://github.com/nfqakademija/kickstart)
