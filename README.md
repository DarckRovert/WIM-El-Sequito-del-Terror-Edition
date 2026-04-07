# WIM — Instant Messenger (v9.4.0 [Comm-Tier]) 💬⚔️

> **The definitive private messaging experience for Turtle WoW.** Integrada en el ecosistema **El Séquito del Terror** con el primer **Puente Neural de Traducción** nativo. Bajo la supervisión técnica de **DarckRovert**.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![Version](https://img.shields.io/badge/version-v9.4.0--Comm--Tier-blue)](./CHANGELOG.md)
[![World of Warcraft](https://img.shields.io/badge/WoW-1.12.1--Turtle-orange)](https://turtle-wow.org)
[![Support](https://img.shields.io/badge/Support-Ko--fi-blue)](https://ko-fi.com/darckrovert)

---

## 💬 ¿Qué hace especial a esta versión de WIM?

Más allá de organizar tus susurros en ventanas, esta edición está conectada al **Traductor Universal v2.0** de pfUI.

### 🧩 Messenger Feature Matrix (Capacidades)

| Módulo | Tipo de Datos | Funcionalidad | Descripción |
| :--- | :--- | :--- | :--- |
| **Translator Bridge** | Neural Sync | Traducción In-Situ | Susurros entrantes traducidos automáticamente |
| **History Engine** | Data Persistence | Registro de Sesión | Historial de mensajes entre sesiones de juego |
| **Tabbed Chat** | UI Management | Agrupación de Chats | Múltiples conversaciones en una sola interfaz limpia |
| **Apex Skins** | Visual Mod | Branding DarckRovert | Colores y bordes corporativos integrados |
| **Url Copy** | Text Utility | Extracción de Enlaces | Copia URLs directamente desde las ventanas de chat |

### ⚡ Benchmarks de Comunicación (v9.4)

| Proceso | Latencia Séquito | Latencia Standard | Estado |
| :--- | :---: | :---: | :---: |
| **Neural Translation** | ~1ms | N/A | ✅ |
| **History Load** | < 10ms | ~50ms | ✅ |
| **Message Render** | 0.05s (Throttled) | Constant | ✅ |

---

## 🏗️ Suite de Documentación (Wiki)

Domina tus comunicaciones en nuestra base de conocimientos:

- 📐 **[Arquitectura de Hooks](./wiki/Architecture.md)**: Cómo interceptamos WIM_PostMessage.
- 🛠️ **[Guía de API Messenger](./wiki/API_Guide.md)**: Integración con WCS_Brain y pfUI.
- ❓ **[FAQ de Comunicación](./wiki/FAQ.md)**: Solución a problemas de traducción.
- 📖 **[Manual de Configuración](./wiki/User_Manual.md)**: Guía de perfiles visuales.

## 🚀 Despliegue Rápido (Comm-Flow)

1.  **Limpieza**: Borra cualquier versión previa de `WIM` en `AddOns/`.
2.  **Instalación**: Extrae en `Interface\AddOns\WIM\`.
3.  **Activación**: Al recibir un susurro, WIM se activará. Si tienes el **Traductor v2.0** activo en pfUI, el puente se enganchará automáticamente.

## 🔗 Ecosistema Oficial (DarckRovert)

- [Live Streams (Twitch)](https://twitch.tv/darckrovert)
- [Web Corporativa](https://sequitodelterror.netlify.app/)
- [Soporte & Donaciones (Ko-fi)](https://ko-fi.com/darckrovert)

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Comunicación sin fronteras para la conquista de Azeroth.*
