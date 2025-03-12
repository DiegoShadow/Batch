@echo :::::::::::::::::
@echo ::R:E:S:T:A:R:T::
@echo :::::V:P:N:::::::
@echo :::::::::::::::::

TASKKILL /IM NEGui.exe /F

net stop SONICWALL_NetExtender

net start SONICWALL_NetExtender

@echo :::::::::::::::::::::::::
@echo ::Iniciando NetExtender::
@echo :::::::::::::::::::::::::

@echo off
CD c:\Program Files (x86)\SonicWALL\SSL-VPN\NetExtender\
START NEGui.exe

timeout 3