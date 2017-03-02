# Dazed and Confused Vagrant VM
* It is vagrant vm made while listening to Red Zeppelin's "Dazed and Confused".

## Purpose
* Construction of local development environment for enterprise

## Concept
* I am not planning to do advanced features, advanced.
* I try to work lightly.

## What is set up

### Middleware
1. **CentOS 6**
1. **Java** - v1.8.0
 * **Tomcat** - v8.5.11
 * **Elasticsearch** - v5.x
 * **Kibana**
 * **Logstash**
1. **MySQL** - v5.6
1. **PHP** - v5.6
 * **Opcache**
 * **APC**
1. **Ruby** - v2.3.3
 * **[Mailcatcher](https://mailcatcher.me)**
1. **Memcached** - v1.4

### SCM
1. **SVN** - v1.6.11
1. **GIT** - v1.7.1
1. **HG** - v1.4
1. **[Bash-it](https://github.com/Bash-it/bash-it)**

### CMS
1. **Drupal7** - v7.54
1. **Drupal8** - v8.2.6
1. **Wordpress** - v4.7.2


## How to insall

### Install vagrant command
```
$ cd install/MacOSX/
$ sh 00_install_vagrant.sh
```

### Create Virtualbox
```
$ sh 10_create_centos6-64bit_box.sh
```

### Replace Vagrant & vagrant up

```
# cd ../../centos6-64bit/
$ sh refresh_vagrant.sh
```

### Usual vagrant operation

* cd centos6-64-bit/
* vagrant up
* vagrant halt
* vagrant destroy
* vagrant suspend
* vagrant resume etc...