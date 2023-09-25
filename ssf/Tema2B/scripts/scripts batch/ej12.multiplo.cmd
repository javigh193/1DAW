@echo off
setlocal EnableDelayedExpansion

rem Nombre: ej12-multiplo.cmd
rem Objetivo: dada una lista de números, se pide un número para 
rem			indicar qué números de la lista son múltiplos suyos 
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=indeterminado
rem Salida: resultado de la operación escogida desde un menú
rem Fecha: 17.02.2023
rem Versiónes: 1.0 (código inicial)

set num_arg=0
for %%i in (%*) do Set /A num_arg+=1

set /p number="Itroduzca un numero: "

echo Discriminando cuales de los siguientes numeros son multiplos de %number%: %*
for %%i in (%*) do (
	set /a discriminante= %%i %% !number!
	if !discriminante! NEQ 0 (
		echo El numero %%i NO es multiplo de !number!
	) else (
		echo El numero %%i ES multiplo de !number!
	)
)