<div align="center">

<img src="assets/lm-group-logo.svg" alt="LM Group" width="220" />

# LM Group Europe

**A multilingual logistics landing page for international freight across Belarus, Russia, Europe, China and the CIS.**

![HTML](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat-square&logo=tailwindcss&logoColor=white)
![GSAP](https://img.shields.io/badge/GSAP-0AE448?style=flat-square&logo=greensock&logoColor=black)
![Responsive](https://img.shields.io/badge/Responsive-Design-d11f2a?style=flat-square)

</div>

## Overview

LM Group Europe is a production-ready single-page website for an international freight and warehouse logistics company. The visual system combines strong typography, a restrained monochrome palette and a signature red accent with cinematic video and motion.

The site is designed to communicate reliability and scale while keeping the path to contact direct and frictionless.

## Highlights

- Multilingual experience in Russian, English and German
- Responsive navigation with a mobile off-canvas menu
- Animated hero background built with OGL and WebGL
- GSAP-powered interface motion and transitions
- Service sections with optimized background video
- Direct WhatsApp and email contact actions
- SEO and Open Graph metadata
- Production configuration for Apache, Nginx and Docker
- Optimized caching, compression and HTTPS redirects

## Stack

- Semantic HTML5
- Tailwind CSS 3
- Vanilla JavaScript
- GSAP 3
- OGL / WebGL
- Space Grotesk

## Live site

**https://llclmgroup.com**

## Local development

```bash
npm install
npm run watch:css   # Tailwind в режиме watch
npx serve .         # или любой статический сервер
```

## Production build

Create a deployment archive containing only production assets:

```bash
npm run deploy:zip
```

The generated `deploy.zip` can be uploaded to a standard static hosting environment. Additional deployment instructions are available in `DEPLOY.md`.

## Project structure

```text
.
├── index.html              # Page structure, content and interactions
├── src/input.css           # Tailwind source styles
├── assets/
│   ├── styles.css          # Compiled production CSS
│   ├── *.mp4               # Optimized service videos
│   └── *.svg / *.png       # Brand and interface assets
├── Dockerfile
├── nginx.conf
├── .htaccess
└── site.webmanifest
```

## Credits

Design and development by **Maxim Matsulevich**.

## Rights

This project was created for LM Group. Brand assets, content and visual materials remain the property of their respective owners. The source code is published as a portfolio case and is not licensed for commercial reuse.
