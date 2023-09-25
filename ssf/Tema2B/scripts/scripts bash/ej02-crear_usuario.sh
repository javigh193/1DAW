#!/bin/bash

#############################################################
#
# Nombre: ej02-crea_usuario.sh
# Objetivo: crear un nuevo usuario 
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=3, 1-nombre, 2-apellido, 3-usuario 
# Salida: texto con la información 
#
# Fecha: 17.01.2023
# Versiones: 1.0 (código inicial)
#
##############################################################
if [ $# -ne 3 ]
then 
    echo "Error: cantidad incorrecta de argumentos"
    echo "Indique nombre, apellido, usuario"
else
    nombre=$1
    apellidos=$2
    usuario=$3
    echo "Bienvenido, $nombre" 
    echo "Tus datos son: $nombre $apellidos"
    echo "Vamos a crear tu usuario: $usuario"
    echo "Tu id es: $RANDOM"
    echo "Has ejecutado $0 indicando $# argumentos"
fi