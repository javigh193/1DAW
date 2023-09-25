#!/bin/bash

#############################################################
#
# Nombre: bucles
# Objetivo:
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos:
# Salida:
# Fecha: .2023
# Versiónes: 1.0 (código inicial)
#
##############################################################
ini=10
end=20
step=2

for i in `seq $ini $step $end`
do 
	echo "$i"
done

i=1
while [ "$i" -lt 10 ]
do 
	echo "W: $i"
	(( i++ ))
done
