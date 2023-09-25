#!/bin/bash

#############################################################
#
# Nombre: ej15-rectangulo.sh
# Objetivo: dibujar un rectángulo dada su base y su altura
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1-base, 2-altura
# Salida: representación gráfica del rectángulo y área
# Fecha: 15.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [ $# -eq 0 ]
then
base=7
altura=4
elif [ $# -eq 1 ]
then
base=$1
altura=4
else
base=$1
altura=$2
fi

echo "Representación de un rectángulo de base $base y altura $altura (area $(($base * $altura))):"
for i in `seq 1 1 $altura`
do
    for j in `seq 1 1 $base`
    do
    echo -n "X"
    done
    echo ""
done