@echo off
setlocal

rem Nombre: ej06-calcula_tiempos.cmd
rem Objetivo: convierte los segundos a tiempo en días, horas, 
rem minutos y segundos
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=1, 1-segundos
rem Salida: regresa un mensaje indicando el resultado de la 
rem         conversión
rem Fecha: 16.02.2023
rem Versiones: 1.0 (código inicial)

set segundos=%1
echo %segundos% segundos son:
set /a dias=%segundos% / 86400
set /a horas=(%segundos% %% 86400) / 3600
set /a minutos=((%segundos% %% 86400) %% 3600) / 60
set /a segundos=((%segundos% %% 86400) %% 3600) %% 60
echo %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos