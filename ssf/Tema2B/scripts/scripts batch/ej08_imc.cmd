@echo off
setlocal

rem Nombre: ej08-imc.cmd
rem Objetivo: calcular el índice de masa corporal
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=2, 1-altura, 2-peso
rem Salida: imc y clasificación según OMS
rem Fecha: 16.02.2023
rem Versiónes: 1.0 (código inicial)

if "%1"=="" (
	echo "Se deben indicar la altura y el peso"
	exit /b
)
if "%2"=="" (
	echo "Se deben indicar la altura y el peso"
	exit /b
)

set altura=%1
set peso=%2

echo %altura% %peso%

set /a imc=(10000 * %peso% / (%altura% * %altura%))

if %imc% LEQ 19 ( echo "Su imc de %imc% indica un peso bajo.")

if %imc% LSS 25 (
	if %imc% GTR 19 ( echo "Su imc de %imc% indica un peso normal.")
)

if %imc% LSS 30 (
	if %imc% GEQ 25 ( echo "Su imc de %imc% indica sobrepeso.")
)

if %imc% GEQ 30 ( echo "Su imc de %imc% indica obesidad.")