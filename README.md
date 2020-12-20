# Standard Notes Syncing Server for YunoHost

[![Integration level](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver)  
[![Install SNServer with YunoHost](https://install-app.yunohost.org/install-with-yunohost.png)](https://install-app.yunohost.org/?app=snserver)

> *This package allow you to install snserver quickly and simply on a YunoHost server.  
If you don't have YunoHost, please see [here](https://yunohost.org/#/install) to know how to install and enjoy it.*

## Overview

Standard Notes syncing server

You can run your own Standard Notes server and use it with any Standard Notes app. This allows you to have 100% control of your data.

**Shipped version:** 3.13.6
* Apps available for free. https://standardnotes.org/ 
* Desktop (Windows, Mac, Linux)
* Mobile (Android and iOS)
* Web https://app.standardnotes.org/
* Self-Hosted Yunohost - Web-App https://github.com/FabianWilkens/snweb_ynh
> Change Sync Server Domain during Registation and Sign in

## Screenshots

![](https://camo.githubusercontent.com/ca3744729c6c33f2f42d7917a4e7167c12a786615e14d1719f7d1ec6ed77aae8/68747470733a2f2f7374616e646172646e6f7465732e6f72672f6173736574732f686f6d65706167652d6865726f2e706e67)
Extensions, Editors, Themes: https://standardnotes.org/extensions


## Demo

* [Official demo - Web App](https://standardnotes.org/demo)

## Configuration

How to configure this app: 
* The config-file is stored under "/opt/yunohost/$app/live/.env"

## Documentation

 * Official documentation: https://docs.standardnotes.org

## YunoHost specific features

#### Multi-users support

* Are LDAP and HTTP auth supported?	No
* Can the app be used by multiple users?	Yes

#### Supported architectures

* x86-64b - [![Build Status](https://ci-apps.yunohost.org/ci/logs/snserver%20%28Apps%29.svg)](https://ci-apps.yunohost.org/ci/apps/snserver/)
* ARMv8-A - [![Build Status](https://ci-apps-arm.yunohost.org/ci/logs/snserver%20%28Apps%29.svg)](https://ci-apps-arm.yunohost.org/ci/apps/snserver/)

## Limitations

* Any known limitations.

## Additional information

* Other information you would add about this application

**More information on the documentation page:**  
https://yunohost.org/packaging_apps

## Links

 * Report a bug: https://github.com/FabianWilkens/snserver_ynh/issues
 * App website: https://standardnotes.org/
 * Upstream app repository: https://github.com/standardnotes/syncing-server
 * YunoHost website: https://yunohost.org/

---

Developers info
----------------

**Only if you want to use a testing branch for coding, instead of merging directly into master.**
Please do your pull request to the [testing branch](https://github.com/FabianWilkens/snserver_ynh/tree/testing).

To try the testing branch, please proceed like that.
```
sudo yunohost app install https://github.com/FabianWilkens/snserver_ynh/tree/testing --debug
or
sudo yunohost app upgrade snserver -u https://github.com/FabianWilkens/snserver_ynh/tree/testing --debug
```
