@ECHO OFF
setlocal

rem Nombre: ej02-crea_usuario.cmd
rem Objetivo: crear un nuevo usuario 
rem Autor: Javier García <javigh1903@movistar.es>
rem
rem Argumentos: total=3, 1-nombre, 2-apellido, 3-usuario 
rem Salida: texto con la información 
rem
rem Fecha: 16.02.2023
rem Versiones: 1.0 (código inicial)

set nombre=%1
set apellido=%2
set usuario=%3
echo Bienvenido, %nombre%
echo Tus datos son: %nombre% %apellido%
echo Vamos a crear tu usuario: %usuario%
echo Tu nueva ID es %RANDOM%
