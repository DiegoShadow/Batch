@echo :::::::::::::::::::::::::::::::::::::::::
@echo :          DELETAR MSLicensing          :
@echo : Resolve o problema com licenca de RDP :
@echo :::::::::::::::::::::::::::::::::::::::::
@echo off
timeout 3
@echo :::::::::::::::::::::::::::::::::::
@echo :  Removendo registro defeituoso  :
@echo :::::::::::::::::::::::::::::::::::
reg delete HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSLicensing /f
timeout 3
@echo :::::::::::::::::::::::::::::::::::::::::
@echo :  Executando o RDP como ADMIN LOCAL    :
@echo :::::::::::::::::::::::::::::::::::::::::
runas /User:administrador mstsc
timeout 3
@echo ::::::::::::::::::::::::::::::
@echo : Logue em qualquer terminal :
@echo : para recriar o registro    :
@echo ::::::::::::::::::::::::::::::
pause