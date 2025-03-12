@ECHO OFF

set INTERFACE=Ethernet
set IP=10.61.82.7
set MASCARA=255.255.0.0
set GATEWAY=10.61.0.1
set DNS1=10.204.0.5
set DNS2=10.204.0.6
REM ***** You don’t need to change anything below this line! ******

ECHO Configurando IP Address, Subnet Mask e Gateway
netsh interface ip set address name = %INTERFACE% source = static addr = %IP% mask = %MASCARA% gateway = %GATEWAY% gwmetric = 1

ECHO Configuracao para DNS Primario
netsh int ip set dns name = %INTERFACE% source = static addr = %DNS1%

ECHO Configuracao para DNS Secundario
netsh int ip add dns name = %INTERFACE% addr = %DNS2%

ECHO Estas sao as novas configuracoes do computador %computername%:
netsh int ip show config

pause