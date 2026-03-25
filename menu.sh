#!/bin/bash

# borramos el entorno si viene con -d
if [ "$1" == "-d" ]; then
    rm -r ~/EPNro1 2>/dev/null
    killall consolidar.sh 2>/dev/null
    exit 0
fi

archivo_salida="$HOME/EPNro1/salida/$FILENAME.txt"

while true; do
    echo "--- Menu ---"
    echo "1. Crear entorno"
    echo "2. Correr proceso"
    echo "3. Listado por padron"
    echo "4. Mostrar las 10 mejores notas"
    echo "5. Buscar por padron"
    echo "6. Salir"
    read -p "Opcion: " opc

    case $opc in
        1)
            mkdir -p ~/EPNro1/entrada
            mkdir -p ~/EPNro1/salida
            mkdir -p ~/EPNro1/procesado
            cp consolidar.sh ~/EPNro1/
            chmod +x ~/EPNro1/consolidar.sh
            echo "entorno creado"
            ;;
        2)
            ~/EPNro1/consolidar.sh &
            echo "proceso lanzado en background"
            ;;
        3)
            if [ -f "$archivo_salida" ]; then
                sort -k1 -n "$archivo_salida"
            else
                echo "no hay datos"
            fi
            ;;
        4)
            if [ -f "$archivo_salida" ]; then
                # ordena descendente por nota (columna 5) y me quedo con los primeros 10
                sort -k5 -n -r "$archivo_salida" | head -n 10
            else
                echo "no hay datos"
            fi
            ;;
        5)
            read -p "ingrese padron: " padron
            grep "^$padron " "$archivo_salida"
            ;;
        6)
            break
            ;;
        *)
            echo "opcion invalida"
            ;;
    esac
    echo ""
done
