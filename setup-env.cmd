@echo off
rem Configure the current cmd.exe session so MSVC can find getopt-msvc-helper.
rem Run from cmd.exe with:
rem   call setup-env.cmd

set "GETOPT_MSVC_HELPER_ROOT=%~dp0"
if "%GETOPT_MSVC_HELPER_ROOT:~-1%"=="\" set "GETOPT_MSVC_HELPER_ROOT=%GETOPT_MSVC_HELPER_ROOT:~0,-1%"

call :append_path INCLUDE "%GETOPT_MSVC_HELPER_ROOT%\include"
call :append_path LIB "%GETOPT_MSVC_HELPER_ROOT%\lib"

echo INCLUDE contains: %GETOPT_MSVC_HELPER_ROOT%\include
echo LIB contains: %GETOPT_MSVC_HELPER_ROOT%\lib

set "GETOPT_MSVC_HELPER_ROOT="
goto :eof

:append_path
set "_name=%~1"
set "_entry=%~2"
call set "_current=%%%_name%%%"
if not defined _current (
    set "%_name%=%_entry%"
    set "_name="
    set "_entry="
    set "_current="
    goto :eof
)

echo ;%_current%; | findstr /C:";%_entry%;" >nul
if errorlevel 1 set "%_name%=%_current%;%_entry%"
set "_name="
set "_entry="
set "_current="
goto :eof
