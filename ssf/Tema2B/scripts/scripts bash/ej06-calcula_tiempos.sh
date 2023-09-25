#!/bin/bash

#############################################################
#
# Nombre: ej06-calcula_tiempos.sh
# Objetivo: convierte los segundos a tiempo en días, horas, 
# minutos y segundos
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=1, 1-segundos
# Salida: regresa un mensaje indicando el resultado de la 
#         conversión
# Fecha: 31.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 1 ]
then
    echo "Error: cantidad incorrecta de parámetros"
    echo "Indicar los segundos"
else
#en un día hay 24h, en una hora hay 60 minutos, en un minuto hay 60 segundos
    segundos=$1
    dias=$(($1/86400))
    horas=$((($1%86400)/3600))
    minutos=$(((($1%86400)%3600)/60))
    seg_restantes=$(((($1%86400)%3600)%60))
    echo "$segundos segundos equivalen a $dias días, $horas horas, $minutos minutos y $seg_restantes segundos"
fi