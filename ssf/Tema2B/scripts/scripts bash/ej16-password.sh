#!/bin/bash

#############################################################
#
# Nombre: ej16-password.sh
# Objetivo: escribir por teclado sin ver los caracteres 
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: ninguno
# Salida: interacción mediante teclado e interfaz de terminal
# Fecha: 15.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

read -s -p "Genere la contraseña: " password

echo ""

read -s -p "Introduzca la contraseña: " password_in

echo ""

while [ $password != $password_in ]
do
    read -s -p "Contraseña erronea, introduzca la contraseña: " password_in
    echo ""
done

echo "Contraseña correcta, puede seguir con su vida."