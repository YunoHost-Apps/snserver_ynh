# Standard Notes Server pour YunoHost

[![Niveau d'intégration](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)  
[![Installer Standard Notes Server avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Read this readme in english.](./README.md)*
*[Lire ce readme en français.](./README_fr.md)*

> *Ce package vous permet d'installer Standard Notes Server rapidement et simplement sur un serveur YunoHost.
Si vous n'avez pas YunoHost, regardez [ici](https://yunohost.org/#/install) pour savoir comment l'installer et en profiter.*

## Vue d'ensemble



**Version incluse :** 2021.08.30~ynh1

**Démo :** https://standardnotes.org/demo

## Avertissements / informations importantes

* Any known limitations, constrains or stuff not working, such as (but not limited to):
    * No single-sign on or LDAP integration
    * Ram requirements (Swap memory will be created during install):
        * The app requires at least 800MB of RAM to work properly.
        * The app requires at least 1000MB of RAM to start.
        * The app requires at least 1500MB of RAM to install.

* Other infos that people should be aware of, such as:
    * The ".env" config-files are stored under "/opt/yunohost/$app/live/"
    * You can change the url of this app, but than all useres have to reinstall the extensions.

## Documentations et ressources

* Site officiel de l'app : https://standardnotes.org/
* Documentation officielle utilisateur : https://standardnotes.com/help
* Documentation officielle de l'admin : https://docs.standardnotes.org/
* Dépôt de code officiel de l'app : https://github.com/standardnotes/standalone
* Documentation YunoHost pour cette app : https://yunohost.org/app_snserver
* Signaler un bug : https://github.com/YunoHost-Apps/snserver_ynh/issues

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche testing](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

Pour essayer la branche testing, procédez comme suit.
```
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
ou
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Plus d'infos sur le packaging d'applications :** https://yunohost.org/packaging_apps