#!/bin/bash

#############################################################
#
# Nombre: menu case
# Objetivo: elaborar una interfaz gráfica con menú case
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: ninguno
# Salida: imprime información para que el usuario pueda pedir
#         acciones a través de la terminal
# Fecha: 19.01.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

echo ""
echo "++++++++++++"
echo "+          +"
echo "+   MENÚ   +"
echo "+          +"
echo "++++++++++++" 
echo ""

echo "1: porlibre"
echo "2: tamlibre"
echo "3: usuario"
echo "4: máquina"
echo "5: usuarios"
echo "6: espacio"
echo "7: donde"
echo "8: cuando"

read -p "Indica la opción: " opcion

case $opcion in 
	1|porlibre) por_used=`df /root -h --output='pcent'| grep -e '[0-9]%' | cut -d '%' -f 1` 
	   			por_libre=$((100 - $por_used))
	   			echo "Espacio libre en /root: $por_libre%"
	;; 
	2|tamlibre) tam_libre=`df /root -h --output='avail'| grep -e '[0-9]'` 
	   			echo "Espacio libre en /root: $tam_libre"
	;;
	3|usuario) echo "$USER" #whoami
	;;
	4|máquina) uname -r 
	;; 
	5|usuarios) cut -d ':' -f 1 /etc/passwd
	;;
	6|espacio) espacio=`df ~ -h --output='used'| grep -e '[0-9]'` 
			   echo "Espacio usado en /home: $espacio"
	;;
	7|donde) pwd
	;;
	8|cuando) date
	;;
	*) echo "$opcion no es un valor válido"
	;;
esac
