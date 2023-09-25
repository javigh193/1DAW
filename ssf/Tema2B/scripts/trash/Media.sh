#!/bin/bash

#############################################################
#
# Nombre: Media.sh
# Objetivo: Dado un conjunto de valores en formato array calcular 
# 	    la media de dichos valores	
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: un array de números
# Salida: la media de dichos valores
# Fecha: 24.01.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################
function calcula_media {
	valores=$@
	cantidad=$#
	suma=0
	for valor in $valores
	do
		((suma=suma+valor))
	done

	promedio=$((suma/cantidad))

	echo "El promedio es: $promedio"
}

a=(323 43 245 125 361 51 14)
b=(51 155 513 231 123 5 311 44)

calcula_media ${a[@]}
calcula_media ${b[@]}
