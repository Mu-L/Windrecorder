@echo off
title Windrecorder
mode con cols=70 lines=10
color 75
echo.
echo   Initializing Windrecorder, please stand by...
echo.
echo   Please stay in this window until it disappears
echo.

cd /d %~dp0
if exist "hide_CLI_by_python.txt" (
    goto begin
) else (
    goto hide
)

:hide
@REM hide CLI immediately
if "%1"=="h" goto begin
start mshta vbscript:createobject("wscript.shell").run("%~nx0"^&" h",0)^&(window.close) && exit /b

:begin
cd /d %~dp0
for /F "tokens=* USEBACKQ" %%A in (`python -m poetry env info --path`) do call "%%A\Scripts\activate.bat"

python "%~dp0\main.py"