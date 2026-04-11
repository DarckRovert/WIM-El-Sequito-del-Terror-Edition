# 🏰 Arquitectura de Comunicación — WIM [COMM-TIER]

## 1. Intercepción del Flujo de Mensajes
WIM [Séquito Edition] utiliza un hook nuclear sobre la función `WIM_PostMessage`. Esta ubicación es estratégica porque:
*   Maneja tanto mensajes entrantes (`ttype == 1`) como salientes (`ttype == 2`).
*   Es el punto previo al renderizado en el `WIM_History`, lo que garantiza que el historial también se guarde traducido.

## 2. Puente Neural de Sincronización
El puente se conecta directamente con el motor de **pfUI:Translator (v1.0.0 [Omni-Tier])**:
*   **Detección Automática**: Si pfUI está cargado y el módulo activo, WIM engancha las librerías léxicas sin intervención del usuario.
*   **Throttling**: Se ha optimizado el renderizado de la ventana para que el proceso de traducción no genere saltos de frame al recibir "spam" de susurros.

## 3. Skinning "Apex-Tier"
El diseño visual se sincroniza con el motor de bordes de pfUI mediante `Modules\UITheme.lua`, eliminando texturas pesadas y optimizando el `Memory Footprint`.

## 4. Corrección de Cascade Logic (v1.3.3)
Se ha restaurado la función `WIM_UpdateCascadeStep` que gestiona el desplazamiento incremental de las ventanas abiertas:
*   **Recurrencia**: El offset se reinicia tras 10 ventanas para evitar que los elementos se desplacen fuera del viewport.
*   **Estabilidad**: Al ser una función global integrada en `WIM.lua`, se elimina el error de referencia nula que bloqueaba la inicialización de mensajes entrantes.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Soberanía Comunicativa Comm-Tier.*
