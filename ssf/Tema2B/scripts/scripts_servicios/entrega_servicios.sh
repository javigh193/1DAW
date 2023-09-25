#!/bin/bash

#############################################################
#
# Nombre: entrega_servicios.sh
# Objetivo: un script que confirma si un proceso es un servicio 
#           o no y, en caso de serlo, da una serie de opciones 
#           al usuario para modificar su estado
#
# Autor: Kelpy Gómez Camín, Javier García <javigh1903@movistar.es>
#
# Argumentos: el nombre del supuesto servicio
# Salida: información sobre el supuesto servicio
# Fecha: 12.03.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

if [[ $# -lt 1 ]]
then
read -p "Introduzca el nombre del servicio: " service_name
else
service_name=$1
fi
if [[ `systemctl status $service_name 2>/dev/null | wc -l` -eq 0 ]] 
then
echo "No se encuentra un servicio con ese nombre, se aborta el programa."
exit 10
else
while [[ 1 -eq 1 ]] 
do
is_active=`systemctl is-active $service_name`
is_enabled=`systemctl is-enabled $service_name`
echo '-----------------------------------------------------------------'
echo "El estado del servicio $service_name es: $is_active, $is_enabled"
echo '-----------------------------------------------------------------'
echo '¿Qué desea hacer?'
echo '-----------------------------------------------------------------'
if [[ $is_active == 'inactive' && $is_enabled != 'masked' ]]
then
echo '1.Activar el servicio'
elif [[ $is_active == 'active' ]]
then
echo '1.Desactivar el servicio'
else
echo '1.Opción no disponible'
fi
if [[ $is_enabled == 'disabled' ]]
then
echo "2.Habilitar"
elif [[ $is_enabled == 'enabled' ]]
then
echo "2.Deshabilitar"
else
echo "2.Opción no disponible"
fi
if [[ $is_enabled == 'masked' ]]
then
echo '3.Desenmascarar el servicio'
elif [[ $is_enabled != 'masked' ]]
then
echo "3.Enmascarar"
fi
echo "4.Mostrar configuración"
echo "5.Recargar o reiniciar"
echo "6.Probar a recargar o reiniciar"
echo "7.Mostrar el tiempo de carga total del sistema"
echo "8.Mostrar el tiempo de carga de este servicio"
echo "9.Apagar la máquina"
echo "10.Reiniciar la máquina"
echo "11.Salir"
echo '-----------------------------------------------------------------'
read -p "Opción: " opcion  
case $opcion in
    1) if [[ $is_active == 'inactive' && $is_enabled != 'masked' ]]
       then
       sudo systemctl start $service_name
       elif [[ $is_active == 'active' ]]
       then
       sudo systemctl stop $service_name
       else
       echo 'Opción no disponible en estos momentos'
       fi
    ;;
    2) if [[ $is_enabled == 'disabled' ]]
        then
        sudo systemctl enable $service_name
        elif [[ $is_enabled == 'enabled' ]]
        then
        sudo systemctl disable $service_name
        fi
    ;;
    3) if [[ $is_enabled == 'masked' ]]
       then
       sudo systemctl unmask $service_name
       elif [[ $is_enabled != 'masked' ]]
       then 
       sudo systemctl mask $service_name
       else
       echo "Opción no disponible en estos momentos"
       fi
    ;;
    4) systemctl show $service_name
    ;;
    5) sudo systemctl reload-or-restart $service_name
    ;;
    6) sudo systemctl try-reload-or-restar $service_name
    ;;
    7) systemd-analyze 
    ;;
    8) if [[ `systemd-analyze blame | grep $service_name | wc -l` -ne 0 ]]
       then 
       systemd-analyze blame | grep $service_name
       else
       echo "No se dispone de la información requerida, lo lamentamos"
       fi
    ;;
    9) sudo systemctl isolate runlevel0.target  
    ;;
    10) sudo systemctl isolate runlevel6.target 
    ;;
    11) exit
    ;;
    *) echo "Opción incorrecta"
    ;;
esac
done
fi