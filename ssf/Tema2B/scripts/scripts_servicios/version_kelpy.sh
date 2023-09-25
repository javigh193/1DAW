#!/bin/bash
##################################################
#NOMBRE: script-servicios.sh
#OBJETIVO: Cumplir con los requisitos de la tarea
#AUTORES: Kelpy Gómez Camín 
#<keelpygomez@gmail.com>
#ARGUMENTOS(1): Nombre
#SALIDA: Se muestran los resultados por pantalla
#FECHA: 15/03/23
#VERSIONES: 1.0 (Código inicial)
####################################################

service_name=$1

#Si el usuario no indica argumento, se pide hasta que lo haga:
while [[ -z $service_name ]]; do
    read -p "Introduce el nombre de servicio: " service_name
done

#Función que comprueba si el argumento indicado es un servicio o no:
is_service(){
    echo ' '
    systemctl status $service_name > /dev/null 2>&1
    error=$?
    if [[ $error == '4' ]]; then
        echo "El nombre indicado no es un servicio"
        return 10
        exit
    else
        echo "El nombre indicado es un servicio"
    fi
}

is_service ${service_name}

is_active(){
    echo ' '
    echo 'Resumen del estado del servicio: '$service_name' '
    active=$(systemctl is-active $service_name)
    if [[ $active == 'active' ]]; then
        echo "-> ACTIVO: Sí"
    else
        echo "-> ACTIVO: No"
    fi
}

is_enabled(){
    enabled=$(systemctl is-enabled $service_name)
    if [[ $enabled == 'enabled' ]]; then
        echo "-> HABILITADO: Sí"
    else
        echo "-> HABILITADO: No"
    fi
}

is_masked(){
    masked=$(systemctl is-enabled $service_name)
    if [[ $masked == 'masked' ]]; then
        echo "-> ENMASCARADO: Sí"
    else
        echo "-> ENMASCARADO: No"
    fi
}

is_active ${service_name}
is_enabled ${service_name}
is_masked ${service_name}


select opcion in "Activar" "Habilitar" "Enmascarar" "Mostrar_configuración" "Aplicar_cambios_activo" "Aplicar_cambios_guardando_estado" "Tiempo_carga_sistema" "Tiempo_carga_servicio" "Apagar_máquina" "Reiniciar_máquina" "Salir"
do
    case $opcion in
        Activar) 
        if [[ $active == 'inactive' && $masked != 'masked' ]]; then
            sudo systemctl start $service_name
        else
            read -p '¿Desea desactivar el servicio (S/N)?: ' answer
            if [[ $answer == 'S' ]]; then
                sudo systemctl stop $service_name
            fi
        fi
        ;;
        Habilitar)
        if [[ $enabled != 'enabled' ]]; then
            sudo systemctl enable $service_name
        else
            read -p '¿Desea deshabilitar el servicio (S/N)?: ' answer
            if [[ $answer == 'S' ]]; then
                sudo systemctl disable $service_name
            fi
        fi
        ;;
        Enmascarar)
        if [[ $masked != 'masked' ]]; then
            sudo systemctl mask $service_name
        else
            read -p '¿Desea desenmascarar el servicio (S/N)?: ' answer
            if [[ $answer == 'S' ]]; then
                sudo systemctl unmask $service_name
            fi
        fi
        ;;
        Mostrar_configuración) systemctl show $service_name
        ;;
        Aplicar_cambios_activo) sudo systemctl reload-or-restart $service_name
        ;;
        Aplicar_cambios_guardando_estado) sudo systemctl try-reload-or-restart $service_name
        ;;
        Tiempo_carga_sistema) uptime -p
        ;;
        Tiempo_carga_servicio) systemd-analyze blame | grep $service_name
        ;;
        Apagar_máquina) systemctl isolate runlevel0.target
        ;;
        Reiniciar_máquina) systemctl isolate runlevel6.target
        ;;
        Salir) exit
        ;;
    esac
done
