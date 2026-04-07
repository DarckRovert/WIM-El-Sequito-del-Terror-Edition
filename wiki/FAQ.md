# ❓ Wiki: FAQ [El Séquito del Terror] — WIM

Preguntas frecuentes y resolución de problemas técnicos para el cliente de mensajería v9.4+.

## 🛠️ Error: Los susurros no se traducen en la ventana.
- **Causa**: El **Puente Neural** requiere que el **Traductor Universal v2.0** esté activado en pfUI.
- **Solución**: Asegúrate de que `pfUI -> Traductor -> Puente WIM` esté marcado. Si acabas de activarlo, realiza un `/reloadui`.

## ⚙️ ¿Por qué mi historial de chat está vacío?
- **Carga Tardía**: WIM carga el historial de forma asíncrona para que no bloquee tu entrada al mundo. Dale 5-10 segundos en ciudades densas.
- **Persistencia**: Si has borrado tu carpeta `WTF`, el historial local se habrá perdido irremediablemente.

## ⚡ El juego da picos de lag al recibir un susurro largo.
**Estado**: ✅ Optimizado en v9.4.0.
- El parser de intercepción de WIM ahora usa throttles para el renderizado del texto, evitando el stuttering.

---
© 2026 **DarckRovert** — El Séquito del Terror.
*Comunicación sin fronteras para la conquista de Azeroth.*
