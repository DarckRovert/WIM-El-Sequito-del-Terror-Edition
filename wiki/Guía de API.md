# 🔌 Guía de API — WIM [COMM-TIER]

Esta guía detalla las funciones públicas disponibles para la integración con otros addons del ecosistema **DarckRovert**.

## 1. Mensajería Central

### `WIM_PostMessage(user, msg, ttype, from, raw_msg, hotkeyFix)`
Función principal para inyectar mensajes en las ventanas de WIM.
- **`user`**: (string) Nombre del destinatario/remitente.
- **`msg`**: (string) Contenido formateado (soporta colores y links).
- **`ttype`**: (int) Tipo de mensaje:
    - `1`: Susurro entrante.
    - `2`: Susurro saliente.
    - `3`: Mensaje de sistema.
    - `4`: Mensaje de error.
    - `5`: Solo mostrar ventana.
- **`from`**: (string) Quién envía el mensaje.
- **`raw_msg`**: (string) Contenido sin procesar para el historial.

## 2. Información de Jugadores

### `WIM_WhoInfo(name, callback)`
Solicita información del jugador (clase, nivel, raza) de forma asíncrona.
- **`name`**: (string) Nombre del jugador.
- **`callback`**: (function) Función a ejecutar cuando se reciba la información. Recibe una tabla como argumento.

## 3. Utilidades de Ventana

### `WIM_CloseConvo(theUser)`
Cierra la conversación actual con el usuario especificado.

### `WIM_UpdateCascadeStep()`
Incrementa el contador interno para el posicionamiento escalonado de nuevas ventanas.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Soberanía Técnica Diamond-Tier.*
