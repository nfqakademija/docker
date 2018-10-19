#!/usr/bin/env bash

set -e

: ${PROJECT_NAME:="test20181015"}
echo "Creating project $PROJECT_NAME"

echo "Enter password for new user:"
read PROJECT_PASS
echo "Will use pasword $PROJECT_PASS"

if [ -z "$PROJECT_PASS" ]; then
  echo "No password set. Exiting!"
  exit 1
fi
if [ -z "PROJECT_NAME" ]; then
  echo "No project name. Exiting!"
  exit 1
fi

echo "Creating users..."
groupadd $PROJECT_NAME
useradd -g $PROJECT_NAME $PROJECT_NAME
echo "$PROJECT_NAME:$PROJECT_PASS" | chpasswd

echo "Creating directory structure..."
mkdir -p /home/${PROJECT_NAME}/releases/placeholder/public
mkdir -p /home/${PROJECT_NAME}/shared
echo "<?php echo 'NFQ Academy ($PROJECT_NAME). Nothing deployed yet';" > /home/${PROJECT_NAME}/releases/placeholder/public/index.php
ln -s /home/${PROJECT_NAME}/releases/placeholder /home/${PROJECT_NAME}/current
chown $PROJECT_NAME:$PROJECT_NAME -R /home/${PROJECT_NAME}/releases
chown $PROJECT_NAME:$PROJECT_NAME -R /home/${PROJECT_NAME}/shared
chown $PROJECT_NAME:$PROJECT_NAME -R /home/${PROJECT_NAME}/current
chown $PROJECT_NAME:$PROJECT_NAME /home/${PROJECT_NAME}

echo "Configuring PHP FPM..."
echo "[$PROJECT_NAME]
user = $PROJECT_NAME
group = $PROJECT_NAME
listen = /var/run/php/${PROJECT_NAME}.sock
listen.allowed_clients =
listen.owner = www-data
listen.group = www-data
listen.mode = 0660
listen.backlog = 65536
pm = dynamic
pm.max_children = 2
pm.start_servers = 1
pm.min_spare_servers = 1
pm.max_spare_servers = 2
pm.process_idle_timeout = 10s
pm.max_requests = 0
pm.status_path = /status
ping.path = /ping
ping.response = /pong
access.format = %R - %u %t "%m %r" %s
request_slowlog_timeout = 0
request_terminate_timeout = 0
access.log = /var/log/php-fpm/access.log
slowlog = /var/log/php-fpm/slow.log
chdir = /
chroot =
catch_workers_output = no
security.limit_extensions = .php
rlimit_files =
rlimit_core =
" > /etc/php/7.2/fpm/pool.d/$PROJECT_NAME.conf

service php7.2-fpm restart

echo "Configuring nginx..."
echo "server {
    listen 80;
    server_name ${PROJECT_NAME}.projektai.nfqakademija.lt;
    root /home/${PROJECT_NAME}/current/public;

    location / {
        try_files \$uri /index.php\$is_args$args;
    }

    location ~ ^/index\.php(/|\$) {
        fastcgi_pass unix:/var/run/php/${PROJECT_NAME}.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)\$;
        include fastcgi_params;

        fastcgi_param SCRIPT_FILENAME \$realpath_root\$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT \$realpath_root;
        internal;
    }

    location ~ \.php\$ {
        return 404;
    }

    error_log /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-error.log;
    access_log /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-access.log;
}" > /etc/nginx/sites-available/${PROJECT_NAME}
ln -s /etc/nginx/sites-available/${PROJECT_NAME} /etc/nginx/sites-enabled/${PROJECT_NAME}
service nginx restart

echo "Files created:"
echo "   /home/${PROJECT_NAME}/releases/placeholder/public/index.php"
echo "   /home/${PROJECT_NAME}/releases/shared"
echo "   /home/${PROJECT_NAME}/current"
echo "   /etc/php/7.2/fpm/pool.d/$PROJECT_NAME.conf"
echo "   /var/run/php/${PROJECT_NAME}.sock"
echo "   /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-error.log"
echo "   /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-access.log"
echo "   /etc/nginx/sites-available/${PROJECT_NAME}"
echo "   /etc/nginx/sites-enabled/${PROJECT_NAME}"
echo "You can access your page at:"
echo "   http://${PROJECT_NAME}.projektai.nfqakademija.lt/"
echo ""
