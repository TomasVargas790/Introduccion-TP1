#!/bin/bash

# este script junta la data en el archivo salida

dir_entrada="$HOME/EPNro1/entrada"
dir_salida="$HOME/EPNro1/salida"
dir_procesado="$HOME/EPNro1/procesado"

while true; do
    # recorro los archivos txt que aparezcan
    for archivo in $dir_entrada/*.txt; do
        if [ -f "$archivo" ]; then
            cat "$archivo" >> "$dir_salida/$FILENAME.txt"
            mv "$archivo" "$dir_procesado/"
        fi
    done
    sleep 3
done
