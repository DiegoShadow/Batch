@echo off
color 0A
@echo ::::::::::::::::::::::::::::::::
@echo ::: - Criando novo Usuario - :::
@echo :::     - ADMINISTRADOR -    :::
@echo ::::::::::::::::::::::::::::::::
@echo(
@echo off
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!! Informe o USUARIO, nao use acentos ou simbolos, apenas  !!!
@echo !!! texto simples como letras e numeros.                    !!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo(
@echo off
SET /p USERNAME=NOVO USUARIO:
net user /add %USERNAME%
@echo(
@echo off
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo !!! Informe o NOME COMPLETO do usuario, nao use acentos     !!!
@echo !!! ou simbolos, apenas texto simples como letras e numeros.!!!
@echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo(
@echo off
SET /p FULLNAME=NOME DO NOVO USUARIO:
net user %USERNAME% /fullname:"%FULLNAME%"
@echo(
@echo off
net localgroup administradores %USERNAME% /add
net accounts /maxpwage:unlimited
WMIC USERACCOUNT WHERE Name='%USERNAME%' SET PasswordExpires=FALSE
@echo(
@echo off
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
echo !! 1. Fazendo Logoff desse usuario   !!
echo !! 2. Logue na nova conta criada     !!
echo !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
@echo(
@echo off
timeout 3
shutdown -L