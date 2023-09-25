#!/bin/bash

#############################################################
#
# Nombre: entrega_servicios.sh
# Objetivo: un script que confirma si un proceso es un servicio 
#           o no y, en caso de serlo, da una serie de opciones 
#           al usuario para modificar su estado
#
# Autores: Kelpy Gómez Camín, Javier García <javigh1903@movistar.es>
#
# Argumentos: el nombre del supuesto servicio
# Salida: información sobre el supuesto servicio
# Fecha: 16.03.2023
# Versiones: 2.0.1 pequeños cambios en el comportamiento de la función de estado
#
##############################################################

#Función que comprueba si el argumento indicado es un servicio:
is_service(){
    service_name=$1
    echo ' '
    systemctl status $service_name > /dev/null 2>&1
    error=$?
    if [[ $error == '4' ]] 
    then
        echo "El nombre indicado no es de un servicio"
    else
        echo "El nombre indicado es de un servicio"
    fi
}

#Función que muestra un resumen del estado del servicio:
service_status(){
    is_active=$1
    is_enabled=$2
    echo ' '
    if [[ $is_active == 'active' ]] 
    then
        echo "-> ACTIVO: Sí"
    else
        echo "-> ACTIVO: No"
    fi
    if [[ $is_enabled == 'enabled' ]] 
    then
        echo "-> HABILITADO: Sí"
        echo "-> ENMASCARADO: No"
    elif [[ $is_enabled == 'disabled' ]]
    then
        echo "-> HABILITADO: No"
        echo "-> ENMASCARADO: No"
    else [[ $is_enabled == 'masked' ]]
        echo "-> ENMASCARADO: Sí"
    fi        
}

service_name=$1
#Si el usuario no indica argumento, se pide hasta que lo haga:
while [[ -z $service_name ]]; do
    read -p "Introduce el nombre de servicio: " service_name
done

#si no es un servicio se interrumpe la ejecución
is_service $service_name
exit 10
while true
do
#se guarda el estado del servicio
    is_active=`systemctl is-active $service_name`
    is_enabled=`systemctl is-enabled $service_name`
    echo ''    
    echo 'Resumen del estado del servicio: '$service_name 
    service_status $is_active $is_enabled
    #menú interactivo, las opciones ofrecidas dependen del estado del servicio
    echo ''
    echo '¿Qué desea hacer?'
    echo ''
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
    echo ''
    read -p "Opción: " opcion  
    case $opcion in
        1)  if [[ $is_active == 'inactive' && $is_enabled != 'masked' ]]
            then
                sudo systemctl start $service_name > /dev/null 2>&1
                wait
            elif [[ $is_active == 'active' ]]
            then
                sudo systemctl stop $service_name > /dev/null 2>&1
                wait
            else
                echo 'Opción no disponible en estos momentos'
                sleep 2s
            fi   
        ;;
        2)  if [[ $is_enabled == 'disabled' ]] 
            then
                sudo systemctl enable $service_name > /dev/null 2>&1
                wait
            elif [[ $is_enabled == 'enabled' ]]
            then
                sudo systemctl disable $service_name > /dev/null 2>&1
                wait
            else
                echo "Opción no disponible en estos momentos"
                sleep 2s
            fi
        ;;
        3)  if [[ $is_enabled == 'masked' ]]
            then
                sudo systemctl unmask $service_name > /dev/null 2>&1
                wait
            else [[ $is_enabled != 'masked' ]] 
                sudo systemctl mask $service_name > /dev/null 2>&1
                wait
            fi
        ;;
        4)  echo ''
            systemctl show $service_name
            wait
        ;;
        5)  sudo systemctl reload-or-restart $service_name
            wait
        ;;
        6)  sudo systemctl try-reload-or-restart $service_name
            wait
        ;;
        7)  echo ''
            systemd-analyze
            wait
            sleep 2s 
        ;;
        8)  if [[ `systemd-analyze blame | grep $service_name | wc -l` -ne 0 ]]
            then
                echo '' 
                systemd-analyze blame | grep $
                wait
                sleep 2s
            else
                echo "No se dispone de la información requerida, lo lamentamos"
                sleep 2s
            fi
        ;;
        9)  sudo systemctl isolate runlevel0.target  
        ;;
        10) sudo systemctl isolate runlevel6.target 
        ;;
        11) exit
        ;;
        *)  echo "Opción incorrecta"
            sleep 2s
        ;;
    esac
done
