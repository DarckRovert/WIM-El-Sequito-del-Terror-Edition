# 📐 Wiki: Arquitectura 'Diamond Tier' — WIM [v9.4.0]

Estructura técnica de la intercepción de mensajería mantenida por **DarckRovert**.

## 🏗️ Jerarquía de Mensajería Instantánea (Messenger Hierarchy)

WIM gestiona la comunicación privada mediante una capa de intercepción sobre el chat nativo:

1.  **Motor de Intercepción (`WIM_Hooks.lua`)**: El punto más crítico. Captura los eventos `CHAT_MSG_WHISPER` y `CHAT_MSG_WHISPER_INFORM`.
2.  **Gestor de PostMessage (`WIM.lua`)**: Procesa los mensajes capturados y decide qué ventana abrir o actualizar. Aquí es donde se inyecta el **Puente Neural**.
3.  **Sistema de Ventanas (`WIM.xml / window.lua`)**: Controla el renderizado de frames y pestañas.
4.  **Capa de Persistencia (`WIM_History.lua`)**: Almacena las conversaciones en las variables locales de la cuenta.

---

## 🧭 Diagrama de Flujo: Puente Neural de Traducción v9.4

```mermaid
graph TD
    A[Evento WoW: CHAT_MSG_WHISPER] --> B[Captura en WIM_Hooks]
    B --> C[Llamada a WIM_PostMessage]
    C --> D{¿Ecosistema Gravity Activo?}
    D -- Sí --> E[Inyección pfUI.Translate]
    D -- No --> F[Render Estándar]
    E --> G[Traducción EN -> ES]
    G --> H[Añadir Tag [TR] y Formatear]
    H --> I[Apertura/Actualización de Ventana WIM]
    I --> J[Guardado en Historial Traducido]
```

## ⚡ Estrategias de Ingeniería Diamond Tier

- **Selective Hooking**: El puente solo se activa si `pfUI` y el módulo `translator` están cargados, garantizando que WIM funcione de forma independiente si es necesario.
- **Async Metadata**: La traducción se realiza en el hilo de procesamiento de mensajes, no en el de renderizado, evitando cualquier parpadeo de la ventana.
- **Branding Sync**: Los colores de las etiquetas de los jugadores en WIM se sincronizan con los colores de clase de pfUI para coherencia total.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Comunicación sin fronteras para la conquista de Azeroth.*
