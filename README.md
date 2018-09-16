Docker containers for KickStart
===============================

Extracting docker related code to spearate repository because:
 * To extract scripts for complex operations (xDebug, prod environment, auto-install)
 * Create versions for dev/prod
 * Create version for preconfigured xDebug with PHPStorm
 * Use same docker infrastructure for fresh/demo Symfony project
 * Setup project in parallel (for lectors to check homework faster)

Usage
-----

Build and start containers:
```bash
docker-compose up -d
```

Test backend:
Open in the browser: [http://127.0.0.1:8000/test.php]

Test frontend:
```bash
docker-compose -f docker-compose-tools.yml run frontend.symfony yarn --version
```

Run IDE via container
```bash
docker-compose -f docker-compose-tools.yml up ide.symfony
```

Run browser:
```bash
docker-compose -f docker-compose-tools.yml up browser.symfony
```

Enable xDebug
-------------

* Assuming you have already started server (`docker-compose up`) and PHPStorm in docker (`docker-compose -f docker-compose-tools.yml up ide.symfony`)
* Enable xDebug on PHP side:
```bash
docker-compose exec php.symfony /enable_xdebug.sh ide.symfony
```
* Enable xDebug on PHPStorm side:
  * Click on `Start Listening for PHP Debug connections` (Handset symbol on the top right corner)
* Add a break point in the code:
  * Click on the area near line numbers. Red circle should appear (E.g. near `echo "Hello world`)
* Open some some page in the browser (E.g. at http://127.0.0.1:8000/test.php)
* Broswer should stop and in PHPStorm will wait for mappings to be configured:
  * In the `Debugger` tab (bottom left panel) you should see:
    `Can't find a source position. Server with name 'nfqKickStartDocker' doesn't exist.`
  * Click on `Configure servers`
  * Click `Add` (plus sign)
  * Name: `nfqKickStartDocker`
  * Host: `127.0.0.1`
  * Port: `8000`
  * Use path mappings:
    * `/code` (File/Direcotry) -> `/code` (add to `Absoulte path on the server` tab)
    * Press _Enter_ so field value could be saved
    * Press `OK`
* You should see warning gone and line highlighted near break point.

Cleanup
-------

Remove running containers:
```bash
docker-compose -f docker-compose.yml kill
docker-compose -f docker-compose-tools.yml kill
```

Remove localy cached files:
```bash
rm -Rf .docker/*
```

#TODO: Kickstarter network

 Links
 -----
 * [Symfony KickStart project](https://github.com/nfqakademija/kickstart)
