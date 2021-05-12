# Standard Notes Server pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg)  ![](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)
[![Installer snserver avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *This package allows you to install snserver quickly and simply on a YunoHost server.
If you don't have YunoHost, please consult [the guide](https://yunohost.org/#/install) to learn how to install it.*

## Vue d'ensemble



**Version incluse:** 3.22.8~ynh2

**Démo:** https://standardnotes.org/demo




## Avertissements / informations importantes

* Any known limitations, constrains or stuff not working, such as (but not limited to):
    * No single-sign on or LDAP integration
    * The app requires up 600MB of RAM to install
    * The app requires at least 110MB of RAM to work properly. And will increase with use.
    * The app requires around 300MB of disk.

* Other infos that people should be aware of, such as:
    * The config-file is stored under "/opt/yunohost/$app/live/.env"
    * You can find additional config features under https://your-domain.tld/yunohost/admin/#/apps/$app/config-panel
    * You can change the url of this app, but than all useres have to reinstall the extensions.



## Documentations et ressources

* Site official de l'app : https://standardnotes.org/
* Documentation officielle utilisateur: https://docs.standardnotes.org/
* Documentation officielle de l'admin: https://docs.standardnotes.org/
* Dépôt de code officiel de l'app:  https://github.com/standardnotes/syncing-server
* Documentation YunoHost pour cette app: https://yunohost.org/app_snserver
* Signaler un bug: https://github.com/YunoHost-Apps/snserver_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
or
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications:** https://yunohost.org/packaging_apps