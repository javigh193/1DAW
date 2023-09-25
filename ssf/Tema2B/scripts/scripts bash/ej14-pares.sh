#!/bin/bash

#############################################################
#
# Nombre: ej14-pares.sh
# Objetivo: calcular los números pares y sus cuadrados, que se
#            encuentren entre dos números dados
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1-cota1, 2-cota2
# Salida: se van mostrando los números pares y su cuadrado, el
#         orden dependerá de qué cota se introduzca primero
# Fecha: 15.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [ $# -eq 0 ]
then
read -p "Introduzca la primera cota: " cota1
read -p "Introduzca la segunda cota: " cota2
elif [ $# -eq 1 ]
then
cota1=$1
read -p "Introduzca la segunda cota: " cota2
else
cota1=$1
cota2=$2
fi

if [ $cota1 -gt $cota2 ]
then
step=-1
elif [ $cota1 -lt $cota2 ] 
then
step=1
else
echo "El intervalo está vacío"
exit
fi

echo "Mostrando los cuadrados de los números pares entre $cota1 y $cota2:"
for i in `seq $cota1 $step $cota2`
do
resto=$(( $i % 2 ))
if [ $resto -eq 0 ]
then
echo "  El cuadrado de $i es $(($i ** 2))"
fi
done