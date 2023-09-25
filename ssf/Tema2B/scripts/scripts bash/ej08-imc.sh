#!/bin/bash

#############################################################
#
# Nombre: ej08-imc.sh
# Objetivo: calcular el índice de masa corporal
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1-altura, 2-peso
# Salida: imc y clasificación según OMS
# Fecha: 31.01.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 2 ]
then
    echo "Error: parámetros incorrectos"
    echo "Indicar altura en cm y peso en kg"
    exit
fi
altura=$1
peso=$2

imc=`echo "scale=2; 10000 * $peso / $altura ** 2" | bc`
echo "$imc"
imc_100=`echo "scale=2; $imc * 100" | bc`
if (($imc_100 < 1850))
then
    echo "Un imc de $imc sugiere un peso bajo"
elif (($imc_100 > 1850 && $imc_100 < 2500))
then
    echo "Un imc de $imc sugiere un peso normal"
elif (($imc_100 >= 2500 && $imc_100 < 3000))
then    
    echo "Un imc de $imc sugiere sobrepeso"
else
    echo "Un imc de $imc sugiere obesidad"
fi
