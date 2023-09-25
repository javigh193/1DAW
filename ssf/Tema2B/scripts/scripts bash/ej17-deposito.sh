#!/bin/bash

#############################################################
#
# Nombre: ej17-deposito.sh
# Objetivo: calcular el rendimiento anual de un depósito bancario
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=3, 1-euros, 2-%TAE, 3-años
# Salida: se va mostrando el rendimiento tras cada año
# Fecha: 16.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [ $# -ne 3 ]
then
echo "Error de parámetros, se deben indicar 3 parámetros en el siguiente orden:
        1 - euros depositados
        2 - %TAE
        3 - años"
exit 100
fi
euros=$1
TAE=$2
anos=$3
acumulado=0
anterior=$euros
echo "Mostrando los datos para un depósito de $euros euros con interés $TAE a $anos años:"
for i in `seq 1 1 $anos`
do
        acumulado=`echo "scale=2; $anterior * (1 + ($TAE/100))" | bc`
        margen=`echo "scale=2; $acumulado - $euros" | bc`
        echo "Año $i: $anterior * ( 1 + $TAE/100) = $acumulado euros (en total has ganado $margen euros)"
        anterior=$acumulado
done