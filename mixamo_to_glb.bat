@echo off

set DIR=%~dp0

call "%DIR%\utils\parseArgs.bat" "%~1" "%~2"

set CHARACTER_FILE="%~1"
set ANIMATIONS_DIR="%~2"

for %%i in (%2) do set BASE_NAME=%%~nxi
set GLB_OUTPUT_FILE=%3
if "%OUTPUT_FILE%"=="" set GLB_OUTPUT_FILE=%BASE_NAME%

echo Generating %GLB_OUTPUT_FILE% with character %CHARACTER_FILE% with animations from %ANIMATIONS_DIR%

set GDLIB_CHARACTER_FILE=%CHARACTER_FILE%
set GDLIB_ANIMATIONS_DIR=%ANIMATIONS_DIR%
set GDLIB_OUTPUT_FILE=%GLB_OUTPUT_FILE%

blender.exe --background -noaudio -P "%DIR%\mixamo_to_glb.py"
