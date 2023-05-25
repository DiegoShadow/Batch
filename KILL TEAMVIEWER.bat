@echo ::::::::::::::::::::::
@echo ::::::::K:I:L:L:::::::
@echo ::T:E:A:M:V:I:E:W:E:R:
@echo ::::::::::::::::::::::

@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "TeamViewer"') do (
    set count=%%#
)

taskkill /F /IM TeamViewer_Service.exe /T

echo Number of TeamViewer 13 processes removed: %count%

timeout 3

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "TeamViewer"') do (
    set count=%%#
)

taskkill /F /IM TeamViewer.exe /T

echo Number of TeamViewer 13 processes removed: %count%

timeout 3

@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "TeamViewer_Desktop"') do (
    set count=%%#
)

taskkill /F /IM TeamViewer_Desktop.exe /T

echo Number of TeamViewer 13 processes removed: %count%

timeout 3

@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "tv_x64"') do (
    set count=%%#
)

taskkill /F /IM tv_x64.exe /T

echo Number of TeamViewer 13 processes removed: %count%

timeout 3

@echo off

for /f "tokens=1 delims=" %%# in ('qprocess^|find /i /c /n "tv_w32"') do (
    set count=%%#
)

taskkill /F /IM tv_w32.exe /T

echo Number of TeamViewer 13 processes removed: %count%

timeout 3