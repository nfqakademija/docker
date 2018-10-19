New administrator for NFQ Academy servers
=========================================

* Copy [automation scripts](scripts/) (adapted from [DigitalOcian tutorial](https://www.digitalocean.com/community/tutorials/how-to-host-multiple-websites-securely-with-nginx-and-php-fpm-on-ubuntu-14-04))
* [Update MySql password](https://support.rackspace.com/how-to/mysql-resetting-a-lost-mysql-root-password/)

Understanding deployment
------------------------

```
ci.nfqakademija.lt                                             PROJECT.projektai.nfqakademija.lt/
      |                                                                     |
      | HTTP                                                                | HTTP
      V                                                                     V
 CI Server (firewalled)                                               WEB server (firewalled)
      |                                                                     |
      |Building                                             as PROJECT user | jenkins@akademija-ci in authorised_keys
      |                                                                     |
      +-------------using-ansible---as-jenkins@akademija-ci---via-SSH-------+
      ^
      |
      | git clone
      |
github.com/nfqakademija/PROJECT
```
Where `PROJECT` is the name the NFQ Academy project

Ansible configuration
---------------------

`ansible_host=deploy.nfqakademija.lt` is a link to WEB server,
where `deploy.nfqakademija.lt` is defined in `/etc/hosts` in CI Server

`ansible_user=kickstart` defines which user to use when connecting to WEB server.
All web users have `jenkins@akademija-ci` in their's `~/.ssh/authorised_keys`
