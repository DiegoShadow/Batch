@echo off

cls

cd %systemroot%\system32\spool\printers

net stop spooler

del /f /s /q *.SHD

del /f /s /q *.SPL

net start spooler

exit