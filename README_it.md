<!--
N.B.: Questo README è stato automaticamente generato da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>
NON DEVE essere modificato manualmente.
-->

# Standard Notes Server per YunoHost

[![Livello di integrazione](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![Stato di funzionamento](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![Stato di manutenzione](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)

[![Installa Standard Notes Server con YunoHost](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Leggi questo README in altre lingue.](./ALL_README.md)*

> *Questo pacchetto ti permette di installare Standard Notes Server su un server YunoHost in modo semplice e veloce.*  
> *Se non hai YunoHost, consulta [la guida](https://yunohost.org/install) per imparare a installarlo.*

## Panoramica

Standard Notes is an end-to-end encrypted note-taking app for digitalists and professionals. Capture your notes, files, and life’s work all in one secure place.


**Versione pubblicata:** 2023.01.26~ynh1

**Prova:** <https://standardnotes.org/demo>
## Attenzione/informazioni importanti

* No single-sign on or LDAP integration
* Ram requirements ( 4GB swap memory will be created during install ):
* Configuration can be changed under: https://my_domain.tld/yunohost/admin/#/apps/$app_id/config-panel

## :red_circle: Anti-funzionalità

- **Risorse non libere**: Contiene ed utilizza risorse mediatiche non libere. Il caso più comune è l’utilizzo da parte dell’app di contenuti artistici (immagini, suoni, musica, ecc.) coperti da licenza commerciale.
- **Pacchetto non mantenuto**: Questo pacchetto di YunoHost non è più mantenuto e necessita di essere adottato.

## Documentazione e risorse

- Sito web ufficiale dell’app: <https://standardnotes.org/>
- Documentazione ufficiale per gli utenti: <https://standardnotes.com/help>
- Documentazione ufficiale per gli amministratori: <https://docs.standardnotes.org/>
- Repository upstream del codice dell’app: <https://github.com/standardnotes/server>
- Store di YunoHost: <https://apps.yunohost.org/app/snserver>
- Segnala un problema: <https://github.com/YunoHost-Apps/snserver_ynh/issues>

## Informazioni per sviluppatori

Si prega di inviare la tua pull request alla [branch di `testing`](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

Per provare la branch di `testing`, si prega di procedere in questo modo:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
o
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Maggiori informazioni riguardo il pacchetto di quest’app:** <https://yunohost.org/packaging_apps>
