#!/bin/bash

#############################################################
#
# Nombre: area.sh
# Objetivo: calcular el área de un rectángulo
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: $1=base del rectángulo, $2=altura del rectángulo
# Salida: se imprime en pantalla el área del rectángulo
#
# Fecha: 13.01.2023
# Versiónes: 1.0 (código inicial)
#
#############################################################

base=$1
altura=$2
unidad=metros

#pidiéndolo por terminal al usuario:
#
#echo -n "Introduce el tamaño de la base:"
#read base
#
#read -p "Introduce el tamaño de la altura: " altura
#
#se trabaja con valores enteros
area=$((base*altura))

echo "El rectángulo de base $base $unidad y altura $altura $unidad tiene un área de $area $unidad cuadrados."
