# Actividad: Creación de un entorno de ejecución aislado (sandbox) y prueba de la aplicación "lavadero"

> Repositorio: `PPSUnidad1-ActividadSandboxingTuNombre`  
> Archivos clave: `apartado5_reflexion.md`, `sandboxing_memoria.md`, `lavadero.py`, `main_app.py`, `requirements.txt`

---

## 1. Objetivo
Crear un entorno controlado para ejecutar la aplicación Python *lavadero* y documentar los pasos de instalación y ejecución, cumpliendo con la idea de “sandboxing” sin afectar el sistema principal.

---

## 2. Elección del sandbox
Debido a problemas de instalación y ejecución de Docker en el sistema (el motor de Docker bloqueaba la máquina), se optó por un **entorno virtual de Python (`venv`)**, que:

- Aísla el proyecto de otros paquetes del sistema.  
- Permite ejecutar la aplicación de forma controlada.  
- Es reproducible en cualquier sistema con Python 3.

---

## 3. Pasos realizados

### 3.1 Creación del entorno virtual

```bash
# Crear el entorno virtual
python3 -m venv venv

# Activar el entorno virtual
source venv/bin/activate   # Linux/macOS
# Windows: venv\Scripts\activate

# Instalación de dependencias
pip install -r requirements.txt #En este caso no necesitamos dependencias externas
```

### 3.2 Estructura del proyecto

```bash
 
PPSUnidad1-ActividadSandboxingTuNombre/
├─ apartado5_reflexion.md
├─ sandboxing_memoria.md
├─ lavadero.py
├─ main_app.py
├─ requirements.txt
├─ venv/  # Entorno virtual
└─ screenshots/

```
### 3.3 Ejecución

```bash
python main_app.py

```
### 3.4 Ejemplos de ejecución

```
=======================================================
EJEMPLO 1: Prelavado (S), Secado a mano (S), Encerado (S)
--- INICIO: Prueba de Lavado con Opciones Personalizadas ---
Opciones solicitadas: [Prelavado: True, Secado a mano: True, Encerado: True]

Coche entra. Estado inicial:
----------------------------------------
Ingresos Acumulados: 0.00 €
Ocupado: True
Prelavado a mano: True
Secado a mano: True
Encerado: True
Fase: 0 - Inactivo
----------------------------------------

AVANZANDO FASE POR FASE:
 (COBRADO: 8.70 €) -> Fase actual: 1 - Cobrando
-> Fase actual: 2 - Haciendo prelavado a mano
-> Fase actual: 3 - Echándole agua
-> Fase actual: 4 - Enjabonando
-> Fase actual: 5 - Pasando rodillos
-> Fase actual: 6 - Haciendo secado automático
-> Fase actual: 0 - Inactivo

----------------------------------------
Lavado completo. Estado final:
----------------------------------------
Ingresos Acumulados: 8.70 €
Ocupado: False
Prelavado a mano: False
Secado a mano: False
Encerado: False
Fase: 0 - Inactivo
----------------------------------------
Ingresos acumulados: 8.70 €
----------------------------------------

=======================================================
EJEMPLO 2: Sin extras (Prelavado: N, Secado a mano: N, Encerado: N)
--- INICIO: Prueba de Lavado con Opciones Personalizadas ---
Opciones solicitadas: [Prelavado: False, Secado a mano: False, Encerado: False]

Coche entra. Estado inicial:
----------------------------------------
Ingresos Acumulados: 8.70 €
Ocupado: True
Prelavado a mano: False
Secado a mano: False
Encerado: False
Fase: 0 - Inactivo
----------------------------------------

AVANZANDO FASE POR FASE:
 (COBRADO: 5.00 €) -> Fase actual: 1 - Cobrando
-> Fase actual: 3 - Echándole agua
-> Fase actual: 4 - Enjabonando
-> Fase actual: 5 - Pasando rodillos
-> Fase actual: 7 - Haciendo secado a mano
-> Fase actual: 0 - Inactivo

----------------------------------------
Lavado completo. Estado final:
----------------------------------------
Ingresos Acumulados: 13.70 €
Ocupado: False
Prelavado a mano: False
Secado a mano: False
Encerado: False
Fase: 0 - Inactivo
----------------------------------------
Ingresos acumulados: 13.70 €
----------------------------------------

=======================================================
EJEMPLO 3: ERROR (Encerado S, Secado a mano N)
--- INICIO: Prueba de Lavado con Opciones Personalizadas ---
Opciones solicitadas: [Prelavado: False, Secado a mano: False, Encerado: True]
ERROR DE ARGUMENTO: No se puede encerar el coche sin secado a mano

=======================================================
EJEMPLO 4: Prelavado (S), Secado a mano (N), Encerado (N)
--- INICIO: Prueba de Lavado con Opciones Personalizadas ---
Opciones solicitadas: [Prelavado: True, Secado a mano: False, Encerado: False]

Coche entra. Estado inicial:
----------------------------------------
Ingresos Acumulados: 13.70 €
Ocupado: True
Prelavado a mano: True
Secado a mano: False
Encerado: False
Fase: 0 - Inactivo
----------------------------------------

AVANZANDO FASE POR FASE:
 (COBRADO: 6.50 €) -> Fase actual: 1 - Cobrando
-> Fase actual: 2 - Haciendo prelavado a mano
-> Fase actual: 3 - Echándole agua
-> Fase actual: 4 - Enjabonando
-> Fase actual: 5 - Pasando rodillos
-> Fase actual: 7 - Haciendo secado a mano
-> Fase actual: 0 - Inactivo

----------------------------------------
Lavado completo. Estado final:
----------------------------------------
Ingresos Acumulados: 20.20 €
Ocupado: False
Prelavado a mano: False
Secado a mano: False
Encerado: False
Fase: 0 - Inactivo
----------------------------------------
Ingresos acumulados: 20.20 €
----------------------------------------
```
