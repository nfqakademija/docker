How to deploy project
=====================

ci.nfqakademija.lt will run:
```bash
$WORKSPACE/.deploy/build.sh
echo "[app]
nfqakademija.lt ansible_host=deploy.nfqakademija.lt ansible_user=$JOB_NAME
" > $WORKSPACE/.deploy/ansible_hosts
$WORKSPACE/.deploy/deploy.sh
```