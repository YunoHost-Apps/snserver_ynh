<!--
N.B.: This README was automatically generated by https://github.com/YunoHost/apps/tree/master/tools/README-generator
It shall NOT be edited by hand.
-->

# Standard Notes Server for YunoHost

[![Integration level](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![Working status](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![Maintenance status](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)  
[![Install Standard Notes Server with YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install Standard Notes Server quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Overview

Standard Notes is an end-to-end encrypted note-taking app for digitalists and professionals. Capture your notes, files, and life’s work all in one secure place.


**Shipped version:** 2022.11.18~ynh1

**Demo:** https://standardnotes.org/demo
## Disclaimers / important information

* No single-sign on or LDAP integration
* Ram requirements ( 4GB swap memory will be created during install ):
* Configuration can be changed under: https://my_domain.tld/yunohost/admin/#/apps/$app_id/config-panel

## Documentation and resources

* Official app website: <https://standardnotes.org/>
* Official user documentation: <https://standardnotes.com/help>
* Official admin documentation: <https://docs.standardnotes.org/>
* Upstream app code repository: <https://github.com/standardnotes/server>
* YunoHost documentation for this app: <https://yunohost.org/app_snserver>
* Report a bug: <https://github.com/YunoHost-Apps/snserver_ynh/issues>

## Developer info

Please send your pull request to the [testing branch](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

To try the testing branch, please proceed like that.

``` bash
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
or
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**More info regarding app packaging:** <https://yunohost.org/packaging_apps>
