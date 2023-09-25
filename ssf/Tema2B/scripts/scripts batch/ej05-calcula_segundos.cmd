@echo off
setlocal

rem Nombre: ej05-calcula_segundos.cmd
rem Objetivo: convierte a segundos el tiempo indicado
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=4, 1-días, 2-horas, 3-minutos, 4-segundos
rem Salida: regresa un mensaje indicando el resultado de la 
rem         conversión
rem Fecha: 16.02.2023
rem Versiones: 1.0 (código inicial)

set dias=%1
set horas=%2
set minutos=%3
set segundos=%4
echo %dias% dias, %horas% horas, %minutos% minutos y %segundos% segundos son:
set /a horas=%horas%+%dias%*24
set /a minutos=%minutos%+%horas%*60
set /a segundos=%segundos%+%minutos%*60
echo %segundos% segundos