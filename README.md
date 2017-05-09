# Dazed and Confused Vagrant VM
* It is vagrant vm made while listening to Red Zeppelin's "Dazed and Confused".

## Purpose
* Construction of local development environment for enterprise

## Concept
* I am not planning to do advanced features, advanced.
* I try to work lightly.

## Overview
* Virtual machines are **Vitrualbox**
* Virtual machine management is **Vagrant**
* Middleware configuration management is **Ansible**

## What is set up

### Middleware
1. **CentOS 6.6(2.6.32-504.el6.x86_64)**
1. **Java** - v1.8.0
 * **Tomcat** - v8.5.11
 * **Elasticsearch** - v5.x
 * **Kibana**
 * **Logstash**
1. **MySQL** - v5.6
1. **PHP** - v5.5.38
 * **Opcache**
 * **APC**
1. **Ruby** - v2.3.3
 * **[Mailcatcher](https://mailcatcher.me)**
1. **Memcached** - v1.4
1. **Ansible**
1. **ImageMagick**

### SCM
1. **SVN** - v1.6.11
1. **GIT** - v1.7.1
1. **HG** - v1.4
1. **[Bash-it](https://github.com/Bash-it/bash-it)**

### CMS
1. **Drupal7** - v7.54
1. **Drupal8** - v8.2.6
1. **Wordpress** - v4.7.2

### Command line
1. **htop**
1. **colordiff**
1. **multitail**

---

## How to insall

### Install vagrant command

* There is only an installer on MacOS.

```
$ cd install/MacOSX/
$ sh install_vagrant.sh
```

### Start the VM with vagrant and start building it

```
# cd ../../centos6-64bit/
$ sh refresh_vagrant.sh
```
* include `vagrant up`

## Confirmation

### Admin page
![Admin page](README/admin_page.png)
  * Access by the following URL
  * http://dazed.vagrant.vm/admin/

### Send mail test
* Send from mail test form
* http://dazed.vagrant.vm/admin/mail_test.php
![Mail form page](README/send_mail_test.png)
* Mail sent can be confirmed with mailcachter.
* It will never be sent to the outside.
* http://mailcatcher.dazed.vagrant.vm
![Mailcatcher page](README/mail_catcher.png)


---

## Usual vagrant operation

```
$ cd centos6-64-bit/
$ vagrant up
$ vagrant halt
$ vagrant destroy
$ vagrant suspend
$ vagrant resume
etc...
```
