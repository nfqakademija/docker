#!/usr/bin/env bash

: ${PROJECT_NAME:="test20181015"}
echo "Will remove project $PROJECT_NAME"

read -p "Are you sure (Y/n)? " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
  set -x
  rm -f /etc/nginx/sites-enabled/${PROJECT_NAME}
  rm -f /etc/nginx/sites-available/${PROJECT_NAME}
  service nginx restart
  rm -f /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-error.log
  rm -f /var/log/nginx/${PROJECT_NAME}.projektai.nfqakademija.lt-access.log
  rm -f /etc/php/7.2/fpm/pool.d/$PROJECT_NAME.conf
  service php7.2-fpm restart
  rm -f /var/run/php/${PROJECT_NAME}.sock
  userdel -r -f ${PROJECT_NAME}
else
  echo "Skipping removal"
fi
