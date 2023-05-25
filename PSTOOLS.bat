@echo :::::::::::::::::::::::::::::::::::::::::
@echo :::: Listando aplicativos do PSTOOLS ::::
@echo :::::::::::::::::::::::::::::::::::::::::
@echo :.
@echo off

cd %windir%\system32
dir ps*.exe

@echo :.
@echo :::: Exemplos de comandos para executar no computador remoto ::::
@echo :.
@echo :: FORCE RESTART :: psshutdown \\computador -r -e p:2:3
@echo :: OU
@echo :: FORCE RESTART :: shutdown -r -f -m \\nome_do_pc
@echo :.
@echo :.
@echo :: MOSTRA USERS :: qwinsta /server:NOME_DO_PC
@echo :: FORCE LOGOFF :: logoff /server:NOME_DO_PC [id] /v
@echo :.

timeout 3

@echo :.
@echo :::::::::::::::::::::::::::::::::::::::::::::
@echo :::: Execute o comando desejado a seguir ::::
@echo :::::::::::::::::::::::::::::::::::::::::::::
@echo :.

cmd


shutdown -r -f -m \\sistel8204