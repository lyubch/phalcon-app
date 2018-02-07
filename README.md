<p align="center">
    <h1 align="center">Phalcon Application Example</h1>
    <br>
</p>

Phalcon Application Example is a skeleton of [Phalcon PHP Framework](https://phalconphp.com) full-stack PHP framework delivered as a C-extension.

DIRECTORY STRUCTURE
-------------------

```
app                      contains application components
    controllers          contains web controller classes
db                       contains db related items
    migrations           contains Phinx migrations
public                   contains the entry script and web resources
vagrant                  contains vagrant configs
    apache2              contains apache2 configs
    config               contains users configs
    provision            contains provision scripts
vendor                   contains dependent 3rd-party packages
```

## Installing using Vagrant

This way is the easiest but long (~20 min).

**This installation way doesn't require pre-installed software (such as web-server, PHP, MySQL etc.)** - just do next steps!

#### Manual for Linux/Unix users

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Prepare project:
   
   ```bash
   git clone https://github.com/lyubch/phalcon-app.git
   cd phalcon-app/vagrant/config
   cp vagrant-local.example.yml vagrant-local.yml
   ```
   
4. Edit settings at your `vagrant-local.yml` if need
5. Change directory to project root:

   ```bash
   cd phalcon-app
   ```

5. Run command:

   ```bash
   vagrant up
   ```
   
That's all. You just need to wait for completion! After that you can access project locally by URLs:
* Application URL: http://phalcon-app.loc
* PhpMyAdmin URL: http://phalcon-app.loc/phpmyadmin
   
#### Manual for Windows users

1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Reboot
4. Prepare project:
   * download repo [phalcon-app](https://github.com/lyubch/phalcon-app/archive/master.zip)
   * unzip it
   * go into directory `phalcon-app-master/vagrant/config`
   * copy `vagrant-local.example.yml` to `vagrant-local.yml`

5. Edit settings at your `vagrant-local.yml` if need

6. Open terminal (`cmd.exe`), **change directory to project root** and run command:

   ```bash
   vagrant up
   ```
   
   (You can read [here](http://www.wikihow.com/Change-Directories-in-Command-Prompt) how to change directories in command prompt) 

That's all. You just need to wait for completion! After that you can access project locally by URLs:
* Application URL: http://phalcon-app.loc
* PhpMyAdmin URL: http://phalcon-app.loc/phpmyadmin
