#!/bin/bash

#############################################################
#
# Nombre: ej20-calculadora_func.sh
# Objetivo: una calculadora donde las operaciones son funciones
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 1-operando1, 2-operando2
# Salida: un menú de calculadora y los resultados solicitados
# Fecha: 16.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [ $# -eq 0 ]
then
read -p "Introduzca el primer operando: " operando1
read -p "Introduzca el segundo operando: " operando2
elif [ $# -eq 1 ]
then
operando1=$1
read -p "Introduzca el segundo operando: " operando2
else
operando1=$1
operando2=$2
fi

suma(){
    echo $(( $1 + $2))
}

resta(){
    echo $(( $1 - $2 ))
}

multiplicacion(){
    echo $(( $1 * $2 ))
}

division(){
    if [ $2 -eq 0 ]
                then
                echo "División por 0, error"
                else
                echo $(( $1 / $2))
                fi
}

exponenciacion(){
    echo $(( $1 ** $2))
}

resto_division (){
    if [ $2 -eq 0 ]
                      then
                      echo "División por 0, error"
                      else
                      echo $(( $1 % $2))
                      fi
}

echo ""
echo "+++++++++++++++++++"
echo "+                 +"
echo "+   Calculadora   +"
echo "+                 +"
echo "+++++++++++++++++++" 
echo ""

echo "1: suma"
echo "2: resta"
echo "3: multiplicación"
echo "4: división"
echo "5: exponenciación"
echo "6: resto_división"

read -p "Indica la opción: " opcion

case $opcion in 
	1|suma) suma $operando1 $operando2
	;; 
	2|resta) resta $operando1 $operando2 
	;;
	3|multiplicación) multiplicacion $operando1 $operando2 
	;;
	4|división) division $operando1 $operando2 
	;; 
	5|exponenciación) exponenciacion $operando1 $operando2 
	;;
	6|resto_división) resto_division $operando1 $operando2 
	;;
	*) echo "$opcion no es un valor válido"
	;;
esac