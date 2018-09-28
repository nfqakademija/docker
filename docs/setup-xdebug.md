How to enable xDebug
====================

# 1. Assuming you are running docker containers

Start your containers (it is safe to rerun even containers are already started):
```bash
scripts/start.sh
```

To test:
```bash
docker ps --format '{{.Names}}'
```
Should print:
> ```
> php.symfony
> mysql.symfony
> nginx.symfony
> ```

# Get Ip of your machine

## For Linux you can use docker interface

```bash
ifconfig docker0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}'
```
It should give something like:
>```
>172.17.0.1
>```

## For Mac (OS X) users use special DNS name

For [`Docker for Mac`](https://docs.docker.com/docker-for-mac/networking/#i-want-to-connect-from-a-container-to-a-service-on-the-host),
you can use:
>```
>host.docker.internal
>```

## For other situations use your network address

Use your computer's [LAN IP address](https://www.iplocation.net/find-private-ip-address)
(not the one of internet facing router)

