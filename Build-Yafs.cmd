@echo off
setlocal
"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -ExecutionPolicy Bypass -File "%~dp0Build-Yafs.ps1" %*
if errorlevel 1 (
  echo YAFS build failed. Read the error above.
  pause
  exit /b 1
)
echo YAFS release is ready in the dist folder.
pause
