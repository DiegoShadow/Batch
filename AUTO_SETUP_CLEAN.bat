@echo off
color 0A
@echo======================================================================
@echo================ AUTO SETUP BY DIEGO SHADOW =======================
@echo======================================================================
@echo(
@echo off
@echo :: 1. Ativando user ADMINISTRADOR local...
CMD /C NET USER Administrador /active:yes
@echo(
@echo off
@echo :: 2. Definindo validade da senha de ADMINISTRADOR para "NUNCA EXPIRA"...
CMD /C NET ACCOUNTS /maxpwage:unlimited
@echo(
@echo off
@echo :: 3. Definindo senha do ADMINISTRADOR para a senha default...
CMD /C NET USER Administrador "senha##123"
@echo(
@echo off
@echo :: 4. Instalando apps basicos...
CD apps
msiexec /i 7z2106-x64.msi /quiet /L*V "7zip_setup.log"
msiexec /i GoogleChromeStandaloneEnterprise64.msi /quiet /L*V "GoogleChrome_setup.log"
msiexec /i NetExtender-10.2.315.MSI /qn /norestart /L*V "NetExtender_setup.log"
regedit.exe /S TeamViewer_Host_config.reg
msiexec /i TeamViewer_Host.MSI /quiet /L*V "TeamViewer_Host_setup.log"
GoogleDriveSetup --silent --desktop_shortcut /L*V "GoogleDriveSetup_setup.log"
Notepad++.exe /S /sAll /L*V "Notepad++_setup.log"
AcroRdrDC1900820071_pt_BR.exe /sAll /rs /msi EULA_ACCEPT=YES /L*V "AcrobatReader_setup.log"
@echo(
@echo off
@echo :: 5. Removendo vestigios de OFFICE (ClickToRun)... 
powershell set-executionpolicy remotesigned
powershell -command "& '.\Kill_Office\Remove-OfficeClickToRun.ps1'"
@echo(
@echo off
@echo :: 6. Instalando Office 2019 ProPlus... 
CD Office2019_Setup
setup /configure Config_OFFICE2019+ACCESS.xml
xcopy calendario.xla "%homedrive%\Program Files\Microsoft Office\root\Office16\Library" /y /q
@echo(
@echo off
@echo :: 7. Criando atalhos no desktop ... 
XCOPY "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Access.lnk" "%homedrive%\Users\Public\desktop" /y /q
XCOPY "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Excel.lnk" "%homedrive%\Users\Public\desktop" /y /q
XCOPY "%ProgramData%\Microsoft\Windows\Start Menu\Programs\PowerPoint.lnk" "%homedrive%\Users\Public\desktop" /y /q
XCOPY "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Word.lnk" "%homedrive%\Users\Public\desktop" /y /q
XCOPY "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Notepad++.lnk" "%homedrive%\Users\Public\desktop" /y /q
XCOPY "%homedrive%\Users\Public\desktop\Iniciar AUTO SETUP.lnk" "%ProgramData%\Microsoft\Windows\Start Menu\Programs\" /y /q
@echo(
@echo off
@echo :: 8. Download do Power BI...
@echo(
@echo off
:escolher
set /P a=Precisa do Power BI? [S/N]?
if /I "%a%" EQU "S" goto :BAIXAR
if /I "%a%" EQU "N" goto :FINALIZAR
goto :escolher

:BAIXAR
echo :: Acessando o link para Download na loja da Microsoft...
start chrome https://www.microsoft.com/pt-br/p/power-bi-desktop/9ntxr16hnw1t#activetab=pivot:overviewtab
TIMEOUT /T 20
:FINALIZAR
@echo(
@echo off
@echo :: 9. Finalizando o AUTO SETUP, tchau ;)
@echo(
@echo off
del "%homedrive%\Users\Public\desktop\Iniciar AUTO SETUP.lnk"
TIMEOUT /T 5
exit