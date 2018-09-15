Docker containers for KickStart
===============================

Extracting docker related code to spearate repository because:
 * To extract scripts for complex operations (xDebug, prod environment, auto-install)
 * Create versions for dev/prod
 * Create version for preconfigured xDebug with PHPStorm
 * Use same docker infrastructure for fresh/demo Symfony project

Usage
-----

Build and start containers:
```bash
docker compose up
```

Test frontend:
```
docker-compose run frontend.symfony yarn --version
```

Test backend:
Open in the browser: [http://127.0.0.1:8000/test.php]

 Links
 -----
 * [Symfony KickStart project](https://github.com/nfqakademija/kickstart)
