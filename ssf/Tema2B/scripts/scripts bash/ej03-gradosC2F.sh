#!/bin/bash

#############################################################
#
# Nombre: ej03-gradosC2F.sh
# Objetivo: convertir grados celcius a farenheit
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=1, 1-grados celcius
# Salida: se imprime en pantalla el resultado de la conversión
#
# Fecha: 13.01.2023
# Versiones: 1.0 (código inicial)
#
#############################################################
if [ $# -ne 1 ]
then
    echo "Error: cantidad de argumentos erronea"
    read -p "Indicar la temperatura: " grados
else
    grados=$1
fi    
farenheit=$(bc<<<$grados*1.8+32) 
echo "$grados grados celcius equivalen a $farenheit grados farenheit"
