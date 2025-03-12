@echo off
for /f "skip=1 tokens=2" %%i in ('query session ^| find "  Disc"') do (
    logoff %%i
)

timeout 5