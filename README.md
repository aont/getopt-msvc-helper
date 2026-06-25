# getopt-msvc-helper

This is a helper library for using `getopt` with MSVC.

## Usage

When building a program that uses `getopt`, configure your shell environment so MSVC can find this repository's headers and library. The helper scripts append the repository-local `include` and `lib` directories to the current session's `INCLUDE` and `LIB` variables.

PowerShell
```powershell
.\setup-env.ps1
```

cmd.exe
```cmd
call setup-env.cmd
```

Then link against `getopt.lib` when building your program.
