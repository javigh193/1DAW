@echo off
setlocal

rem Nombre: ej07-compara.cmd
rem Objetivo: dados dos números nos dice cuál es mayor
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=2, 1: numero1, 2: numero2
rem Salida: nos dice cuál de los dos es mayor
rem Fecha: 16.02.2023
rem Versiones: 1.0 (código inicial)

if "%1"=="" ( set /p num1="Introduzca el primer numero:" ) else ( set num1=%1 )
if "%2"=="" ( set /p num2="Introduzca el segundo numero: " ) else ( set num2=%2 )

if %num1% GTR %num2% ( echo %num1% es mayor que %num2% )
if %num1% LSS %num2% ( echo %num1% es menor que %num2% )
if %num1% EQU %num2% ( echo %num1% es igual que %num2% )