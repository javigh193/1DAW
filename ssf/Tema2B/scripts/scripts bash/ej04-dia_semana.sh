#!/bin/bash

#############################################################
#
# Nombre: ej04-dia_semana.sh 
# Objetivo: dada la fecha en formato numérico, saber el nombre del día 
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=3, 1-dia, 2-mes, 3-año
# Salida: texto indicando el nombre del día 
#
# Fecha: 17.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 3 ]
then
    echo "Error: cantidad de parámetros incorrecta"
    echo "Indicar día, mes, año"
else
    dia=$1
    mes=$2
    ano=$3
    nombre=$(date -d $ano-$mes-$dia +"%A")
    echo "El $dia/$mes/$ano fue $nombre"
fi
