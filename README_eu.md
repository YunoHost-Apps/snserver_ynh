<!--
Ohart ongi: README hau automatikoki sortu da <https://github.com/YunoHost/apps/tree/master/tools/readme_generator>ri esker
EZ editatu eskuz.
-->

# Standard Notes Server YunoHost-erako

[![Integrazio maila](https://dash.yunohost.org/integration/snserver.svg)](https://dash.yunohost.org/appci/app/snserver) ![Funtzionamendu egoera](https://ci-apps.yunohost.org/ci/badges/snserver.status.svg) ![Mantentze egoera](https://ci-apps.yunohost.org/ci/badges/snserver.maintain.svg)

[![Instalatu Standard Notes Server YunoHost-ekin](https://install-app.yunohost.org/install-with-yunohost.svg)](https://install-app.yunohost.org/?app=snserver)

*[Irakurri README hau beste hizkuntzatan.](./ALL_README.md)*

> *Pakete honek Standard Notes Server YunoHost zerbitzari batean azkar eta zailtasunik gabe instalatzea ahalbidetzen dizu.*  
> *YunoHost ez baduzu, kontsultatu [gida](https://yunohost.org/install) nola instalatu ikasteko.*

## Aurreikuspena

Standard Notes is an end-to-end encrypted note-taking app for digitalists and professionals. Capture your notes, files, and life’s work all in one secure place.


**Paketatutako bertsioa:** 2023.01.26~ynh2

**Demoa:** <https://standardnotes.org/demo>
## :red_circle: Ezaugarri zalantzagarriak

- **Libreak ez diren baliabideak**: Libreak ez diren baliabideak ditu eta erabiltzen ditu. Kasurik ohikoena artelanak (irudiak, soinuak, musika, etab.) erabiltzen dituzten aplikazioak dira. - jabedun-lizentziapean.
- **Mantendu gabeko paketea**: YunoHost pakete honek ez du mantenduko duenik, bere gain hartuko duen norbaiten beharra dauka. Honek esan nahi duena da mantentze-lanak minimoak izango direla eta aplikazioa erabiltzen ez duten boluntarioek egingo dituztela lanok; denborak aurrera egin ahala fidagarri izateari utziko dio. [Aplikazioak nola paketatu](https://yunohost.org/packaging_apps_intro) ikas dezakezu, zure gain hartu nahi baduzu.

## Dokumentazioa eta baliabideak

- Aplikazioaren webgune ofiziala: <https://standardnotes.org>
- Erabiltzaileen dokumentazio ofiziala: <https://standardnotes.com/help>
- Administratzaileen dokumentazio ofiziala: <https://docs.standardnotes.org>
- Jatorrizko aplikazioaren kode-gordailua: <https://github.com/standardnotes/server>
- YunoHost Denda: <https://apps.yunohost.org/app/snserver>
- Eman errore baten berri: <https://github.com/YunoHost-Apps/snserver_ynh/issues>

## Garatzaileentzako informazioa

Bidali `pull request`a [`testing` abarrera](https://github.com/YunoHost-Apps/snserver_ynh/tree/testing).

`testing` abarra probatzeko, ondorengoa egin:

```bash
sudo yunohost app install https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
edo
sudo yunohost app upgrade snserver -u https://github.com/YunoHost-Apps/snserver_ynh/tree/testing --debug
```

**Informazio gehiago aplikazioaren paketatzeari buruz:** <https://yunohost.org/packaging_apps>
