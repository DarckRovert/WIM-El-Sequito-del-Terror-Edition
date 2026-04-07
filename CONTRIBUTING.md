# Contributing to WIM (Instant Messenger) 📊💬

¡Gracias por contribuir a la comunicación del **Séquito del Terror**! Para mantener el estándar **Diamond Tier** de **DarckRovert**, todas las contribuciones deben priorizar la integración con el ecosistema **Gravity**.

---

## 🛡️ Estándares Técnicos (Comm Core)

Este AddOn está optimizado para **Turtle WoW** (WoW v1.12.1). Las contribuciones DEBEN cumplir con:

1.  **Bridge Priority**: No alteres la estructura de `WIM_PostMessage` sin asegurar la compatibilidad con el **Traductor Universal v2.0**.
2.  **No Lua 5.1+**: El motor es Lua 5.0. Prohibido el operador `#` (usa `table.getn`).
3.  **UI Performance**: Las ventanas flotantes no deben saturar la memoria del cliente. Usa pools de frames si es necesario para conversaciones múltiples.
4.  **Localización Estricta**: Toda nueva cadena de texto debe añadirse a `localization.lua` y sus variantes de idioma.

## 📐 Arquetipo de Desarrollo

Si deseas contribuir:
- **`WIM.lua`**: Es el motor central. Cualquier cambio aquí requiere validación de hooks.
- **`WIM_Hooks.lua`**: Donde ocurre la magia de la intercepción de mensajes. Optimiza el orden de ejecución para evitar colisiones con otros AddOns del chat.
- **`WIM_History.lua`**: Gestión eficiente de la base de datos de mensajes locales. Evita lecturas/escrituras pesadas en disco durante el combate.

## 💎 Proceso de Pull Request

1.  **Fork & Branch**: Trabaja en ramas descriptivas (`fix/wim-bridge`, `feature/skin-apex`).
2.  **Documentación**: Actualiza `CHANGELOG.md` antes de enviar el PR.
3.  **Branding**: Mantén los enlaces institucionales oficiales de **DarckRovert**.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Comunicación sin fronteras para la conquista de Azeroth.*
