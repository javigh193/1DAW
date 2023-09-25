#!/bin/bash

#############################################################
#
# Nombre: ej12-multiplo.sh
# Objetivo: dada una lista de números, se pide un número para 
#			indicar qué números de la lista son múltiplos suyos 
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=indeterminado
# Salida: resultado de la operación escogida desde un menú
# Fecha: 15.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################
if [ $# -eq 0 ]
then
echo "No se han indicado números para comparar"
exit
fi
read -p "Introduzca el número del que desea buscar sus múltiplos: " num_ref

for num in $@
do
resto=$(($num % $num_ref))
if [ $resto -eq 0 ]
then
	echo "$num es múltiplo de $num_ref"
else
	echo "$num NO es múltiplo de $num_ref"
fi
done