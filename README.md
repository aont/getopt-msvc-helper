# getopt-msvc-helper

This is a helper library for using `getopt` with MSVC.

## Usage

When building a program that uses `getopt`, configure your PowerShell environment so MSVC can find the headers and library:

Powershell
```powershell
$env:INCLUDE += ";path\to\getopt\include"
$env:LIB += ";path\to\getopt\lib"
```

cmd.exe
```cmd
set INCLUDE=%INCLUDE%;path\to\getopt\include
set LIB=%LIB%;path\to\getopt\lib
```

Then link against `getopt.lib` when building your program.
