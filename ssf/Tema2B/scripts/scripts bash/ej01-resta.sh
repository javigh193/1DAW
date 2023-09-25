#!/bin/bash

#############################################################
#
# Nombre: ej01-resta.sh
# Objetivo: hacer la resta de dos argumentos
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1: minuendo, 2: sustraendo
# Salida: resultado de la resta
# Fecha: 19.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -eq 0 ] 
then
	echo "Error: Faltan los argumentos para la operación"
	read -p "Introduzca el minuendo: " minuendo
	read -p "Introduzca el sustraendo: " sustraendo
else
	minuendo=$1
	sustraendo=$2
fi
resultado=$(bc<<<$minuendo-$sustraendo)
echo "El resultado de la operación es: "$minuendo" - "$sustraendo" = "$resultado" "
