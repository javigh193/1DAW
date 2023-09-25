#!/bin/bash

#############################################################
#
# Nombre: ej07-compara.sh
# Objetivo: dados dos números nos dice cuál es mayor
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1: numero1, 2: numero2
# Salida: nos dice cuál de los dos es mayor
# Fecha: 31.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 2 ] 
then
	echo "Error: Faltan los argumentos para la comparación"
	read -p "Introduzca el primer número: " numero1
	read -p "Introduzca el segundo número: " numero2
else
	numero1=$1
	numero2=$2
fi
if [ $numero1 -gt $numero2 ]
then
	echo "$numero1 es mayor que $numero2"
elif [ $numero1 -lt $numero2 ]
then
	echo "$numero2 es mayor que $numero1"
else
	echo "Son el mismo número: $numero1"
fi
