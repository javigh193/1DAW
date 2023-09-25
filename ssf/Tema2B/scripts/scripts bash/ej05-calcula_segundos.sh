#!/bin/bash

#############################################################
#
# Nombre: ej05-calcula_segundos.sh
# Objetivo: convierte a segundos el tiempo indicado
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=4, 1-días, 2-horas, 3-minutos, 4-segundos
# Salida: regresa un mensaje indicando el resultado de la 
#         conversión
# Fecha: 31.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 4 ]
then
    echo "Error: cantidad incorrecta de parámetros"
    read -p "Indicar días, horas, minutos, segundos: " dias horas minutos segundos
else
    dias=$1
    horas=$2
    minutos=$3
    segundos=$4
fi
s_total=$(($segundos+$minutos*60+$horas*60*60+dias*24*60*60))
echo "$dias días, $horas horas, $minutos minutos y $segundos segundos equivalen a $s_total segundos"
