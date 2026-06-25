# getopt-msvc-helper

This is a helper library for using `getopt` with MSVC.

## Build `getopt.lib`

`getopt.lib` must be built before you configure another project to use this helper. The setup scripts only add this repository's `include` and `lib` directories to your current shell environment; they do not build the library for you.

Build the library from a Visual Studio Developer Command Prompt, Developer PowerShell, or any shell where `cl.exe`, `lib.exe`, `nmake.exe`, and `curl.exe` are available on `PATH`:

```cmd
nmake
```

The `Makefile` downloads `getopt.h` into `include\`, downloads `getopt.c` into `src\`, compiles `src\getopt.c` to `obj\getopt.obj`, and archives it as `lib\getopt.lib`.

To remove only the compiled object and library, run:

```cmd
nmake clean
```

To also remove the downloaded `getopt` source and header, run:

```cmd
nmake distclean
```

## Usage

After `lib\getopt.lib` has been built, configure your shell environment so MSVC can find this repository's headers and library. The helper scripts append the repository-local `include` and `lib` directories to the current session's `INCLUDE` and `LIB` variables.

PowerShell
```powershell
.\setup-env.ps1
```

cmd.exe
```cmd
call setup-env.cmd
```

Then link against `getopt.lib` when building your program.
