#!/bin/bash

#############################################################
#
# Nombre: ej13-info_ruta.sh
# Objetivo: mostrar información sobre ciertos elementos del 
#			directorio actual
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: ninguno
# Salida: información sobre existencia o no, permisos, etc. para 
#		  los elementos del directorio actual que tengan más de 4
#         caracteres
# Fecha: 15.02.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

rutas=`ls | grep -E '.{4,}'`
for ruta in $rutas
do
if [ -z "$ruta" ]
then
	echo "ERROR: el script $0 debe ejecutarse con un argumento (ruta)"
	exit
elif [ ! -e "$ruta" ]
then
	echo "La ruta '$ruta' NO existe"
	exit
elif [ -d "$ruta" ]
then
	echo "La ruta '$ruta' es un directorio"
elif [ -f "$ruta" ]
then
	echo "La ruta '$ruta' es un fichero"
elif [ -h "$ruta" ]
then
	echo "La ruta '$ruta' es un enlace simbólico"
else
	echo "La ruta '$ruta' es de otro tipo"
fi

echo -n "Los permisos de ruta son: "
if [ -r "$ruta" ]
then
	echo -n "SI lectura, "
else
	echo -n "NO lectura, "
fi
if [ -w "$ruta" ]
then
        echo -n "SI escritura, "
else
        echo -n "NO escritura, "
fi
if [ -x "$ruta" ]
then
        echo "SI ejecucion."
else
        echo "NO ejecucion."
fi
if [ -s "$ruta" ]
then
        echo "Tamaño de '$ruta' > 0"
else
        echo "Tamaño de '$ruta' = 0"
fi
done