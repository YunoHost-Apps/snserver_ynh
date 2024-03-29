<!--
Nota bene : ce README est automatiquement généré par <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
Il NE doit PAS être modifié à la main.
-->

# Standard Notes Server pour YunoHost

[![Niveau d’intégration](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![Statut du fonctionnement](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![Statut de maintenance](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)

[![Installer Standard Notes Server avec YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Lire le README dans d'autres langues.](./ALL_README.md)*

> *Ce package vous permet d’installer Standard Notes Server rapidement et simplement sur un serveur YunoHost.*  
> *Si vous n’avez pas YunoHost, consultez [ce guide](https://yunohost.org/install) pour savoir comment l’installer et en profiter.*

## Vue d’ensemble

Standard Notes est une application de prise de notes chiffrée de bout en bout pour les numériciens et les professionnels. Capturez vos notes, vos fichiers et le travail de votre vie en un seul endroit sécurisé.


**Version incluse :** 2023.01.26~ynh1

**Démo :** <https://standardnotes.org/demo>
## Avertissements / informations importantes

* Pas d'authentification unique ou d'intégration LDAP.
* Besoins en mémoire vive (4 Go de mémoire swap seront créés pendant l'installation) :
* La configuration peut être modifiée sous : https://my_domain.tld/yunohost/admin/#/apps/$app_id/config-panel

## :red_circle: Anti-fonctionnalités

- **Ressources non libres**: Contient ou utilise des médias non libres. Le cas le plus fréquent concerne des applications utilisant des œuvres (images, sons, musiques, etc.) sous une licence commerciale.
- **Paquet non maintenu**: Ce package YunoHost n'est plus maintenu et doit être adopté.

## Documentations et ressources

- Site officiel de l’app : <https://standardnotes.org/>
- Documentation officielle utilisateur : <https://standardnotes.com/help>
- Documentation officielle de l’admin : <https://docs.standardnotes.org/>
- Dépôt de code officiel de l’app : <https://github.com/standardnotes/server>
- YunoHost Store : <https://apps.yunohost.org/app/snserver>
- Signaler un bug : <https://github.com/YunoHost-Apps/snserver_ynh/issues>

## Informations pour les développeurs

Merci de faire vos pull request sur la [branche `testing`](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

Pour essayer la branche `testing`, procédez comme suit :

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
ou
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Plus d’infos sur le packaging d’applications :** <https://yunohost.org/packaging_apps>
