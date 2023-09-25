#!/bin/bash

#############################################################
#
# Nombre: calculadora.sh
# Objetivo: hacer una calculadora simple
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: dos números
# Salida: resultado de la operación
# Fecha: 24.01.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

num1=$1
num2=$2

#read -p "Introduzca una opción: " opcion

select opcion in "Sumar" "Restar" "Multiplicar" "Dividir" "Potencia" "Raiz" "Salir"
do

case $opcion in
	Sumar) echo "El resultado de $num1 + $num2 es $((num1+num2))";;
	Restar) echo "El resultado de $num1 - $num2 es $((num1-num2))";;
	Multiplicar) echo "El resultado de $num1 * $num2 es $((num1*num2))";;
	Dividir) echo "El resultado de $num1 / $num2 es $((num1/num2))";;
	Potencia) echo "El resultado de $num1 ** $num2 es $((num1**num2))";;
	Raiz) echo "Boom :^)";;
	Salir) break;;
	*) echo "Opción incorrecta";;
esac	

done
