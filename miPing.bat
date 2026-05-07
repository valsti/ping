@echo off
title Herramienta de Diagnostico de Red
color 0A

:MENU
cls
echo   HERRAMIENTA DE DIAGNOSTICO DE RED
echo.
echo 1. Verificacion de Bucle Local (Loopback)
echo 2. Obtener IP de la placa
echo 3. Prueba de Conectividad Estandar
echo 4. Monitoreo Continuo (-t)
echo 5. Definir Cantidad de Paquetes (-n)
echo 6. Prueba de Carga (-l)
echo 7. Resolucion de Nombres (-a)
echo 8. Salir
echo.
set /p opcion=Seleccione una opcion: 

if %opcion%==1 goto LOOPBACK
if %opcion%==2 goto IP
if %opcion%==3 goto PINGNORMAL
if %opcion%==4 goto CONTINUO
if %opcion%==5 goto PAQUETES
if %opcion%==6 goto CARGA
if %opcion%==7 goto RESOLUCION
if %opcion%==8 goto FIN

echo Opcion invalida...
pause
goto MENU

:LOOPBACK
cls
echo Verificacion de Bucle Local
ping 127.0.0.1
pause
goto MENU

:IP
cls
echo Direccion IP del Equipo
ipconfig
pause
goto MENU

:PINGNORMAL
cls
echo Prueba de Conectividad Estandar
set /p url=Ingrese una URL o IP: 
ping %url%
pause
goto MENU

:CONTINUO
cls
echo Monitoreo Continuo
echo Presione Ctrl + C para detener.
set /p url=Ingrese una URL o IP: 
ping -t %url%
pause
goto MENU

:PAQUETES
cls
echo Envio de 10 paquetes
set /p url=Ingrese una URL o IP: 
ping -n 10 %url%
pause
goto MENU

:CARGA
cls
echo Prueba de Carga - 1000 bytes
set /p url=Ingrese una URL o IP: 
ping -l 1000 %url%
pause
goto MENU

:RESOLUCION
cls
echo Resolucion de Nombre de Host
set /p ip=Ingrese una direccion IP: 
ping -a %ip%
pause
goto MENU

:FIN
echo Saliendo del programa...
exit