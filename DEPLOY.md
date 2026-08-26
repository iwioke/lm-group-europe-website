# Деплой LM Group Europe → llclmgroup.com

Статический сайт (HTML + CSS + видео), хостинг — виртуальный хостинг hoster.by
(ISPmanager). Никакой БД, PHP, Node на сервере не требуется.

> Отдельный сайт от казахстанского (llclmgroup.store) — заливается на `llclmgroup.com`.

---

## Сборка архива

```bash
npm run deploy:zip
```

Получаем `deploy.zip` (~6.2 МБ) с продакшен-ассетами:

```
index.html
.htaccess          ← сжатие, кэш, редирект на HTTPS
robots.txt
assets/styles.css
assets/favicon.svg
assets/lm-mark.svg
assets/lm-wordmark.svg
assets/lm-group-logo.png
assets/transport-new.mp4
assets/customs-new.mp4
assets/warehouse.mp4
assets/groupage.mp4
```

`node_modules`, `src/`, `package.json`, `Dockerfile` на хостинг не нужны —
CSS уже скомпилирован в `assets/styles.css`.

---

## Заливка на hoster.by

Корневая папка домена `llclmgroup.com` — обычно `public_html/` или
`~/www/llclmgroup.com/` (точный путь виден в ISPmanager:
**WWW → WWW-домены → llclmgroup.com → «Корневая директория»**).

**Через файловый менеджер ISPmanager:**
1. Удалить заглушку хостера (`index.html`, `index.php`, папку `cgi-bin` не трогать).
2. Закачать `deploy.zip` в корень домена → **Извлечь**.
3. Проверить, что файлы легли в корень (`index.html` и `assets/`), а не в подпапку `deploy/`.
4. Включить показ скрытых файлов, чтобы убедиться что `.htaccess` на месте.

**Через FTP (FileZilla):** хост `ftp.llclmgroup.com`, порт 21, логин/пароль из
панели hoster.by. Распаковать `deploy.zip` локально и перетащить **содержимое**
(не саму папку). Включить «Принудительно отображать скрытые файлы», иначе
`.htaccess` не зальётся. Видео ~6 МБ — по FTP медленнее, чем zip'ом.

---

## SSL и HTTPS

1. ISPmanager → **WWW-домены → llclmgroup.com → SSL → Let's Encrypt** (бесплатный).
2. Дождаться выпуска сертификата.
3. Проверить, что `https://llclmgroup.com` открывается без предупреждений.
4. **Только после этого** раскомментировать редирект в `.htaccess`:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteCond %{HTTPS} off
  RewriteRule ^ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]
</IfModule>
```

> Если включить редирект **до** выпуска сертификата — бесконечный редирект.

---

## Проверка после заливки

- [ ] `https://llclmgroup.com` — hero с анимированными волнами
- [ ] Логотип в шапке, favicon в вкладке
- [ ] Переключение языков RU / EN / DE меняет все тексты
- [ ] Видео в блоке «Услуги» проигрываются
- [ ] На ~1100px — бургер-меню, панель выезжает справа
- [ ] После открытия меню и растягивания окна — страница скроллится
- [ ] Кнопка «Заявка» скроллит к контактам
- [ ] Ссылки WhatsApp и Email кликабельны

Скорость и заголовки кэша: https://pagespeed.web.dev

---

## Обновление

После правок в `index.html` или `src/input.css`:

```bash
npm run deploy:zip
```

и залить заново. Достаточно перезаписать `index.html` и `assets/styles.css` —
видео и картинки менять не нужно, если они не правились.

> **Кэш:** после изменения CSS поднять версию в `index.html`:
> `assets/styles.css?v=21` → `?v=22`, иначе у посетителей останется старый CSS.
