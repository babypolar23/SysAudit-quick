# SysAudit-quick
# SysAudit-Mini 🐧🚀
Este script nos proporciona una herramienta de automatización y auditoría rápida para sistemas Linux, desarrollada en Bash por un Sysadmin en formación y aprendizaje.

## 📋 Descripción del Proyecto
**SysAudit-scan** es un script interactivo diseñado para realizar revisiones rápidas del estado de salud de un servidor Linux, para poder verificar q nuestro equipo esta corriendo en buenas condiciones, además de automatizar tareas clave de administración de sistemas como la verificación de carga, uso de memoria RAM, procesos activos y control de acceso seguro, monitoreo del sistema, verificar el tiempo de actividad del servidor y además de auditorar ficheros críticos para el análisis.

---

## ⚙️ Características Principales
* ** Se crea una variable de entorno que ocupa el comando whoami. (usuario=$(whoami)
* **Identificación Automática:** Detecta el usuario en sesión mediante comandos nativos, para poder determinar qué acciones tomar y qué privilegios tenemos. (whoami).
**Se crea un echo para que el usuario sienta más natural el script, con operador en sesión, ocupando la variable $usuario. (echo "[INFO] Operador en sesión: $usuario")
** Se crea un echo interactuando con el usuario, para q ingrese la contraseña, ocupando el parámetro -n, haciendo que el cursor permanezca en la misma línea después de imprimir el texto y no salte a la siguiente. (echo -n "Por favor, ingresa la clave de autorización del sistema: ").
* **Autenticación Interactiva Segura: Utiliza entradas protegidas (read -s) para ocultar las credenciales al operador en pantalla, para obtener una mayor seguridad y blindaje para el usuario. (read -s).
* **Monitoreo de Sistema en Vivo: Necesitamos monitorear el sistema en directo, para poder ver y analizar nuestro equipo. (htop)
* **Tiempo de actividad del servidor (uptime), porque necesitamos ver cuánto tiempo lleva encendido el servidor, además de mostrarnos cuántos usuarios hay conectados y la carga promedio del procesador (load average), es decir con este comando sabemos la salud general de la máquina.
* **Estado y consumo de la Memoria RAM (free -h), para poder comprenderlo en un formato entendible para nosotros como personas, y no para lenguaje de máquina.
* **Comenzamos con la validación de seguridad con if/else, para poder verificar si la contraseña es la que está después de ==, para poder verificar que acción tomar. (if [[ "$password" == "admin2026" ]] ; then)
* **Se imprime con el comando echo para poder darle una mejor interacción con el usuario, imprímelo un acceso concedido"
* **Procedemos a ver de manera rápida, los procesos que consumen más memoria, y a su vez ver las primeras 6 líneas. (ps aux —sort=-%mem | head -n 6).
* **Creamos un echo, para darle facilidad e interactividad al usuario.
* **Creamos una variable de entorno (archivos_sistema=("hosts" "resolv.conf" "passwd")
* **Auditoría de Ficheros Críticos:** Bucle inteligente (`for`) condicional (`-f`) para verificar la integridad de archivos clave del sistema como /etc/hosts, /etc/resolv.conf y /etc/passwd, con ayuda de un bucle for, vamos a realizar un escaneo del contenido de la variable. (for archivo in “${archivos_sistema[@]}" ; do
* **Implementamos un if/else, para determinar si el contenido de la variable $archivos_sistema,es decir los ficheros existen /etc/$archivo" ]] ; then
Implementamos un echo para darle facilidad e interactividad al usuario.
* **Comienza el comando else y su respectivo echo, en dado caso que no encuentre los ficheros en la ruta ya antes mencionada.
* **Cerramos el bucle "for" con el comando "done".
* **Seguimos con el else y su respectivo echo, no es que el else sea doble, sino que presenta dos condiciones, en este caso, si no se escribe correctamente la contraseña, nos redirige automáticamente, y nos ficha e imprime con echo una alerta roja
**Finalizamos el if/else con el comando "fi"
**Finalizamos el script, con un echo, que nos indica que el script de automatización se llevado a cabo el proceso y que a su vez ah terminado.


---

## 🛠️ Requisitos
* Un sistema operativo basado en Linux (Ubuntu, Debian, CentOS, etc.).
* Una terminal compatible con Bash.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------