How to create new NFQ project?
==============================

```bash
git clone git@github.com:nfqakademija/test20181015.git
cd test20181015
```
Where `test20181015` is name of the project.

```
git remote add kickstart git@github.com:nfqakademija/kickstart.git
git pull kickstart master 
git push origin master
```

In WEB Server:
```bash
new-project.sh test20181015
```

* Create user in Jenkins: http://ci.nfqakademija.lt/securityRealm/addUser
   * User and password same as SSH

* Create job: http://ci.nfqakademija.lt/user/abanelis/my-views/view/all/newJob
   * Item name same as SSH user
   * `Copy from`: `kickstart`
* Configure job:
   * Update URL for project name
   * Source Code Management -> Git -> `Credentials`: `jenkins`

