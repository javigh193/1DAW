#!/bin/bash

#############################################################
#
# Nombre: entrega_procesos.sh
# Objetivo: un script que permite interactuar con los procesos del sistema,
# ofreciendo diferentes opciones en función del uso que hacen de los recursos
# del sistema
# Autor: Javier García <javigh1903@movistar.es>
#
# Argumentos: total=2, 
#               1-maxCPU: %máximo de uso de CPU, 
#               2-maxMem: %máximo de uso de la memoria
# Salida: dependiendo de lo que se pida por el usuario se realizan diferentes
# acciones 
# Fecha: 7.3.2023
# Versiónes: 1.0 (código inicial)
#
##############################################################

#control de entrada de argumentos
if [ $# -lt 2 ]
then
echo '100'
exit 100
elif [[ $1 -lt 0 || $2 -lt 0 ]]
then
echo '200'
exit 200
elif [ $2 -gt 100 ]
then
echo '150'
exit 150
else
maxCPU=$1
maxMem=$2
fi

#definicion de los trap para las señales
trap 'echo "Interrumpiendo ejecución"; exit 0;' SIGINT
trap 'echo "Finalizando ejecución"; exit 0;' SIGTERM
trap 'uptime' SIGUSR1
trap 'pid=`ps -C entrega_proceso -o pid h | head -n 1`;
	  echo $pid;
	  usuario=`ps -q $pid -o euser h`; 
	  echo $usuario
	  killall -u $usuario -s CONT;' SIGUSR2

while true
do

currentMaxMemPid=`ps -eo pid --sort -%mem h | head -n 1`
currentMaxMem100=`ps -q $currentMaxMemPid -o %mem h`
currentMaxMemComm=`ps -q $currentMaxMemPid -o comm h`
currentMaxCPUPid=`ps -eo pid --sort -%cpu h | head -n 1`
currentMaxCPU100=`ps -q $currentMaxCPUPid -o %cpu h`
currentMaxCPUComm=`ps -q $currentMaxCPUPid -o comm h`

loadedCPU=$(bc<<<"$currentMaxCPU100>$maxCPU")
loadedMem=$(bc<<<"$currentMaxMem100>$maxMem")

echo "CPU"
echo $currentMaxCPUPid 
echo $currentMaxCPU100 
echo $currentMaxCPUComm
echo "Mem"
echo $currentMaxMemPid
echo $currentMaxMem100 
echo $currentMaxMemComm 
echo $loadedCPU $loadedMem

if [[ loadedCPU -eq 1 ]]
then
echo "El proceso con PID: $currentMaxCPUPid, originado por el comando $currentMaxCPUComm consume el $currentMaxCPU100% de la CPU."
echo "---------------------------------------"
echo "1: Ignorar aviso, seguir comprobando"
echo "2: Disminuir en 3 puntos la prioridad"
echo "3: Interrumpir el proceso"
echo "4: Terminar el proceso"
echo "5: Finalizar inmediatamente el proceso"
echo "6: Detener el proceso (evitable)"
echo "7: Detener el proceso (no evitable)"
read -p "¿Qué desea hacer?: " opcion
case $opcion in 
	1) echo 'Se ignora el aviso y se continúa monitorizando.'
	;; 
	2) renice +3 $currentMaxCPUPid
	;;
	3) kill -s SIGINT $currentMaxCPUPid 
	;;
	4) kill -s SIGTERM $currentMaxCPUPid
	;;
	5) kill -s SIGKILL $currentMaxCPUPid
	;;
	6) kill -s SIGTSTP $currentMaxCPUPid
	;;
	7) kill -s SIGSTOP $currentMaxCPUPid
	;;
	*) echo "default"
	;;
esac
elif [[ loadedMem -eq 1 ]]
then
echo "El proceso con PID: $currentMaxMemPid, originado por el comando $currentMaxMemComm consume el $currentMaxMem100% de la memoria."
echo "---------------------------------------"
echo "1: Ignorar aviso, seguir comprobando"
echo "2: Disminuir en 3 puntos la prioridad"
echo "3: Interrumpir el proceso"
echo "4: Terminar el proceso"
echo "5: Finalizar inmediatamente el proceso"
echo "6: Detener el proceso (evitable)"
echo "7: Detener el proceso (no evitable)"
read -p "¿Qué desea hacer?: " opcion
case $opcion in 
	1) echo 'Se ignora el aviso y se continúa monitorizando.'
	;; 
	2) renice +3 $currentMaxMemPid
	;;
	3) kill -s SIGINT $currentMaxMemPid 
	;;
	4) kill -s SIGTERM $currentMaxMemPid
	;;
	5) kill -s SIGKILL $currentMaxMemPid
	;;
	6) kill -s SIGTSTP $currentMaxMemPid
	;;
	7) kill -s SIGSTOP $currentMaxMemPid
	;;
	*) echo "default"
	;;
esac
fi
sleep 30
done

