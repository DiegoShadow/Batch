@echo off
set INTERFACE=Ethernet
set IP=10.61.82.07
set MASCARA=255.255.0.0
set GATEWAY=10.61.0.1
set DNS=201.10.128.2
choice /C FAC /M "Pressione: [F]ixo, [A]utomatico ou [C]ancelar"
IF errorlevel=3 goto FIM
IF errorlevel=2 goto AUTOMATICO
IF errorlevel=1 goto FIXO
:FIXO
netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY%
netsh interface ip set dnsservers name="%INTERFACE%" static %DNS% primary no
goto :FIM
:AUTOMATICO
netsh interface ip set address name="%INTERFACE%" dhcp
netsh interface ip set dnsservers name="%INTERFACE%" dhcp
goto :FIM
:FIM
exit

pause