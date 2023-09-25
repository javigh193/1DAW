@echo off
setlocal enableDelayedExpansion

rem Nombre: ej19-calcula_cambio.cmd
rem Objetivo: calcular como devolver el cambio de una compra
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=1, precio de un artículo
rem Salida: cuantos billetes de cada tipo hay que devolver
rem Fecha: 17.02.2023
rem Versiónes: 1.0 (código inicial)

if "%1"=="" ( 
	echo "Se debe indicar el precio del articulo."
	exit /b 
)
set precio=%1
set billetes=500 200 100 50 20 10 5 2 1
set /p pagado="Introduzca la cantidad pagada: "

if %pagado% LSS %precio% (
	echo "Cantidad insuficiente."
	exit /b
)

set /a resto= %pagado% - %precio%

echo "Se ha comprado un producto de %precio% euros con %pagado% euros."
echo "El cambio son %resto% euros, debe entregar:"
(for %%b in (%billetes%) do (
	set /a cantidad=!resto! / %%b
	set /a resto=!resto! %% %%b
	if !cantidad! NEQ 0 ( echo "!cantidad! billete(s) de %%b euros" )
))
