# 🛠️ Wiki: Guía de API — WIM [Instant Messenger]

WIM expone métodos de intercepción y eventos de mensajería para que el ecosistema **Séquito del Terror** pueda extender su funcionalidad.

## 📡 Funciones de Mensajería (Messenger API)

### `WIM_PostMessage(user, msg, ttype, from, raw_msg)`
Función central de envío a ventana.
- **`user`**: Nombre del destinatario.
- **`msg`**: Texto formateado (con colores).
- **`ttype`**: Tipo de mensaje (1=Recibido, 2=Enviado).
- **`raw_msg`**: Texto plano original.

### `WIM.GetHistory(user)`
Obtiene la tabla de mensajes históricos con un jugador específico.
- **Retorno**: Tabla de strings con marcas de tiempo.

## 📎 Integración con Ecosistema Gravity

- **Neural Bridge**: `WIM` detecta automáticamente si `pfUI.Translate` está definido en el espacio global de Lua para activar la traducción in-situ.
- **Terror Alertas**: Puedes enviar notificaciones directas a la ventana de WIM de un oficial usando el canal oculto de eventos `WIM_EVENT_CUSTOM`.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Comunicación sin fronteras para la conquista de Azeroth.*
