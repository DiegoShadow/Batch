@echo off
color 0A
@echo=======================================================
@echo=========== Matar CHROME e EDGE =======================
@echo=======================================================
@echo(
@echo off
@echo :: Selecione a opcao que mais atende sua necessidade ...
@echo(
@echo off
ECHO 1.Matar todos os processos do Google Chrome
ECHO 2.Matar todos os processos do Microsoft Edge
ECHO 3.Matar todos processos de Ambos Navegadores
ECHO 4.Finalizar.
ECHO.

CHOICE /C 1234 /M "Informe o numero da opcao desejada:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 4 GOTO finalizar
IF ERRORLEVEL 3 GOTO ambos
IF ERRORLEVEL 2 GOTO edge
IF ERRORLEVEL 1 GOTO chrome

:chrome
@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "chrome"') do (
    set count=%%#
)

taskkill /F /IM chrome.exe /T

echo Numero de processos do Google Chrome removidos: %count%
GOTO finalizar

:edge
@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "msedge"') do (
    set count=%%#
)

taskkill /F /IM msedge.exe /T

echo Numero de processos do Microsoft Edge removidos: %count%
GOTO finalizar

:ambos
@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "msedge"') do (
    set count=%%#
)

taskkill /F /IM msedge.exe /T

echo Numero de processos do Microsoft Edge removidos: %count%
@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "chrome"') do (
    set count=%%#
)

taskkill /F /IM chrome.exe /T

echo Numero de processos do Google Chrome removidos: %count%
GOTO finalizar

:finalizar
@echo(
@echo off
@echo ipconfig /flushdns
@echo ipconfig /renew
timeout 5