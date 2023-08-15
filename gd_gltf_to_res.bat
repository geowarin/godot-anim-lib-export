@echo off

set DIR=%~dp0

rd /s /q "%DIR%\gd-proj-template\.godot"
godot --path "%DIR%\gd-proj-template" -e --headless --quit

for %%f in ("%DIR%\gd-proj-template\.godot\imported\*.res") do move "%%f" "%1"
