#!/bin/bash
# ==============================================================================
# Nombre del Proyecto: SysAudit-Mini
# Descripción: Script de automatización y auditoría rápida para Sysadmins.
# Autor: Sysadmin en formación (¡Tú!)
# ==============================================================================

echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"
echo "   INICIANDO HERRAMIENTA DE AUDITORÍA: SYSAUDIT   "
echo "/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/"

# 1. Identificación del operador
usuario=$(whoami)
echo "[INFO] Operador en sesión: $usuario"

# 2. Entrada interactiva de seguridad con el parámetro -n (sin salto de línea) y -s (oculto)
echo -n "Por favor, ingresa la clave de autorización del sistema: "
read -s password 
echo ""

# 3. Validación de seguridad con if/else
if [[ "$password" == "admin2026" ]]; then
    echo "--------------------------------------------------"
    echo " [✓] ACCESO CONCEDIDO. Generando reporte..."
    echo "--------------------------------------------------"

    # Reporte de tiempo activo del servidor (Uptime)
    echo "-> 1. Estado del servidor (Uptime):"
    uptime
    echo ""

    # Reporte de Memoria RAM (free -h)
    echo "-> 2. Consumo de Memoria RAM (Free):"
    free -h
    echo ""

    # Reporte de Procesos del Sistema (ps aux --sort=-%cpu |head -n 6)
    echo "-> 3. Procesos activos principales (Top 5):"
    ps aux --sort=-%cpu | head -n 6
    echo ""

    # Lista de archivos críticos de red con bucle for
    echo "-> 4. Verificando ficheros de configuración clave:"
    archivos_sistema=("hosts" "resolv.conf" "passwd")
    
    for archivo in "${archivos_sistema[@]}"; do
        if [[ -f "/etc/$archivo" ]]; then
            echo "    [EXISTE] /etc/$archivo está blindado."
        else
            echo "    [ALERTA] No se localizó /etc/$archivo"
        fi
    done

    echo "--------------------------------------------------"
    echo " [✓] Auditoría completada con éxito."
    echo "--------------------------------------------------"

else
    # Bloque único de error si la contraseña falla
    echo "--------------------------------------------------"
    echo " [X] ALERTA ROJA: Contraseña incorrecta."
    echo " [X] Intento no autorizado registrado. Saliendo..."
    echo "--------------------------------------------------"
fi

echo "Fin del script de automatización, gracias por utilizarlo”
