# Apartado 5 — Reflexión personal: Medidas de seguridad en lenguajes de programación

## Introducción
Los lenguajes de programación incorporan distintas medidas de seguridad en varios niveles: **tipos y verificación estática**, **gestión de memoria**, 
**entornos de ejecución (VMs / runtimes)**, **control de dependencias**, y **herramientas de análisis**. Estas capas ayudan a reducir clases de vulnerabilidades (desbordamientos, condiciones de carrera, ejecución de código no deseado, inyección, etc.), pero ninguna solución es mágica: seguridad = lenguaje + prácticas + entorno.

## Medidas destacadas por tipo de lenguaje

### Lenguajes con gestión segura de memoria:
- **Rust**: evita desbordamientos y uso después de liberar mediante el *ownership model* y el *borrow checker*. Proporciona seguridad en tiempo de compilación sin recolector de basura, reduciendo errores clásicos de memoria.
- **JVM/.NET (Java, C#)**: recolector de basura y chequeos en tiempo de ejecución (por ejemplo, comprobación de índices en arrays) evitan muchos errores de memoria y accesos ilegales.

**Valoración**: Estos enfoques disminuyen fallos críticos de seguridad, aunque puede haber sobrecarga o necesidad de aprendizaje extra (Rust) o dependencia del runtime (JVM/.NET).

### Tipado y verificación estática:
- **Tipado fuerte y estático** detecta inconsistencias en tiempo de compilación, reduciendo errores lógicos y ciertas clases de inyección de datos si se combina con buenas prácticas.
- **TypeScript** aporta seguridad en aplicaciones JS al detectar errores tipo en desarrollo, aunque en ejecución sigue siendo JavaScript.

**Valoración**: El tipado no es suficiente por sí solo (no evita lógicas vulnerables), pero ayuda mucho a reducir la superficie de errores.

### Entornos aislados y sandboxing:
- **Sandbox de navegador** y **security policies (CSP)**: limitan ejecución y recursos de scripts.
- **VMs** (JVM, CLR) proporcionan aislamiento entre el código y el sistema operativo, verificación de bytecode y gestión de permisos.
- **Contenedores y VMs del sistema** (Docker, VMs) aíslan procesos a nivel de OS.

**Valoración**: El sandboxing es una capa esencial para mitigar daños si el código es comprometido; pero debe complementarse con controles de permisos y configuración correcta.

### Bibliotecas, gestión de dependencias y análisis
- **Gestores de paquetes** (pip, npm, crates.io) y herramientas de análisis (SCA — Software Composition Analysis) ayudan a detectar dependencias vulnerables.
- Linters, análisis estático (SAST) y escáneres dinámicos (DAST) añaden capas de defensa.

**Valoración**: La seguridad del ecosistema (librerías y pipeline) es tan importante como la del lenguaje.

## Ventajas y limitaciones prácticas
- **Ventaja:** Lenguajes con seguridad integrada reducen errores comunes y facilitan auditorías.
- **Limitación:** Ningún lenguaje evita malas prácticas (inyección lógica, mal manejo de permisos, exposición de secretos). Además, seguridad a veces entra en conflicto con rendimiento o productividad.

## Recomendaciones personales
1. **Elegir lenguaje según el riesgo**: sistemas críticos → Rust o lenguajes con verificación estricta; aplicaciones empresarial/web → Java/C#/TypeScript con buenas prácticas.
2. **Combinar medidas**: tipado + análisis estático + revisión de dependencias + sandboxing en despliegue.
3. **Formación y procesos**: poner énfasis en reviews, pruebas y CI/CD con controles de seguridad automáticos.

## Conclusión
Los lenguajes aportan mecanismos muy valiosos (memory-safety, type-safety, runtime checks), pero la seguridad real nace de una **concatenación**: elegir un lenguaje adecuado, usar herramientas de análisis, controlar dependencias y desplegar en entornos aislados correctamente configurados.
