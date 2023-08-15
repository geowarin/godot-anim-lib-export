@echo off

set DIR=%~dp0

call "%DIR%\utils\parseArgs.bat" "%~1" "%~2"

set CHARACTER_FILE="%~1"
set ANIMATIONS_DIR="%~2"

for %%i in (%2) do set BASE_NAME=%%~nxi
set OUTPUT_FILE="%~3"
if %OUTPUT_FILE%=="" set OUTPUT_FILE=%BASE_NAME%


call "%DIR%\mixamo_to_glb.bat" %CHARACTER_FILE% %ANIMATIONS_DIR% "%DIR%\gd-proj-template\anims.glb"

call "%DIR%\gd_gltf_to_res.bat" %OUTPUT_FILE%
