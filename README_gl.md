<!--
NOTA: Este README foi creado automáticamente por <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON debe editarse manualmente.
-->

# Standard Notes Server para YunoHost

[![Nivel de integración](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![Estado de funcionamento](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![Estado de mantemento](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)

[![Instalar Standard Notes Server con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Le este README en outros idiomas.](./ALL_README.md)*

> *Este paquete permíteche instalar Standard Notes Server de xeito rápido e doado nun servidor YunoHost.*  
> *Se non usas YunoHost, le a [documentación](https://yunohost.org/install) para saber como instalalo.*

## Vista xeral

Standard Notes is an end-to-end encrypted note-taking app for digitalists and professionals. Capture your notes, files, and life’s work all in one secure place.


**Versión proporcionada:** 2023.01.26~ynh1

**Demo:** <https://standardnotes.org/demo>
## Avisos / información importante

* No single-sign on or LDAP integration
* Ram requirements ( 4GB swap memory will be created during install ):
* Configuration can be changed under: https://my_domain.tld/yunohost/admin/#/apps/$app_id/config-panel

## :red_circle: Debes considerar

- **Non-free assets**: Contains and makes use of non-free assets. The most common case is apps using artwork - images, sounds, music, etc. - under a commercial license.
- **Package not maintained**: This YunoHost package is not actively maintained and needs adoption. This means that minimal maintenance is made by volunteers who don't use the app, so you should expect the app to lose reliability over time. You can [learn how to package](https://yunohost.org/packaging_apps_intro) if you'd like to adopt it.

## Documentación e recursos

- Web oficial da app: <https://standardnotes.org/>
- Documentación oficial para usuarias: <https://standardnotes.com/help>
- Documentación oficial para admin: <https://docs.standardnotes.org/>
- Repositorio de orixe do código: <https://github.com/standardnotes/server>
- Tenda YunoHost: <https://apps.yunohost.org/app/snserver>
- Informar dun problema: <https://github.com/YunoHost-Apps/snserver_ynh/issues>

## Info de desenvolvemento

Envía a túa colaboración á [rama `testing`](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

Para probar a rama `testing`, procede deste xeito:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
ou
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Máis info sobre o empaquetado da app:** <https://yunohost.org/packaging_apps>
