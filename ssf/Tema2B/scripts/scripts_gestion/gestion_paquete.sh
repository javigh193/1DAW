#!/bin/bash

#############################################################
#
# Nombre: gestion_paquete.sh
# Objetivo: preguntar por el estado de un paqute en la máquina y solicitar 
#           al usuario que desea hacer con él
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=1, 1-nombre del paquete a instalar
# Salida: no devuelve algo concreto, realiza modificaciones en la instalación
#
# Fecha: 02.03.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [ $# -eq 0 ]
then
read -p "Introduzca el nombre del paquete a gestionar: " pkg_name
else 
pkg_name=$1
fi

sudo apt-get update

is_installed=`apt-cache policy "$pkg_name" | grep Instalados: | cut -d " " -f 4`
if [[ $is_installed == '(ninguno)' ]]
then
is_available=`apt-cache search "$pkg_name" | grep -E "^$pkg_name"`
echo $is_available
    if [[ -z $is_available ]]
    then
    apt-cache search $pkg_name
    else
    apt-cache show $pkg_name
    read -p "Quiere instalar el paquete $pkg_name? [S/N]" instalar
        if [[ $instalar =~ [Ss] ]] 
        then
        sudo apt-get install $pkg_name
        fi
    fi
elif [[ -z $is_installed ]]
then
echo "Las resultados más cercanos son:"
apt-cache search $pkg_name
else 
echo "1: Mostrar versión"
echo "2: Reinstalar"
echo "3: Actualizar"
echo "4: Eliminar"
echo "5: Purgar"
read -p "¿Qué desea hacer? " opcion
case $opcion in 
	1) apt-cache show "$pkg_name" | grep Version: | cut -d " " -f 1,2
	;; 
	2) sudo apt-get reinstall "$pkg_name" 
	;;
	3) sudo apt-get install "$pkg_name"
	;;
	4) sudo apt-get remove "$pkg_name" 
	;; 
	5) sudo apt-get purge "$pkg_name"
	;;
	*) echo "Opción incorrecta" 
	;;
esac
fi