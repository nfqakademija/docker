Docker containers for KickStart
===============================

Extracting docker related code to spearate repository because:
 * To extract scripts for complex operations (xDebug, prod environment, auto-install)
 * Create versions for dev/prod
 * Create version for preconfigured xDebug with PHPStorm
 * Use same docker infrastructure for fresh/demo Symfony project

Usage
-----

Build:
```bash
docker build php/ -t nfqakademija/docker:php-local
docker build frontend/ -t nfqakademija/docker:frontend-local
```

Test if compiled:
```
docker run nfqakademija/docker:frontend-local yarn --version
```

 Links
 -----
 * [Symfony KickStart projectas](https://github.com/nfqakademija/kickstart)
