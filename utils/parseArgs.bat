@echo off

if "%~1"=="" goto help
if "%~2"=="" goto help

if not exist "%~1" (
  echo [character_file] not readable
  goto help
)

if not exist "%~2\" (
  echo [animations_dir] is not a directory
  goto help
)

exit /b 0

:help
echo Usage:
echo     %0 [character_file] [animations_dir] ^(output^)
exit 1
