@ECHO OFF
SETLOCAL

SET /P STARTDATE="Start Date: "
SET /P ENDDATE="End Date: "
powershell -NoProfile -ExecutionPolicy Bypass -File garfield.ps1 %STARTDATE% %ENDDATE%