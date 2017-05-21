@ECHO OFF
SETLOCAL

SET STARTDATE=2012-01-01 
SET ENDDATE=2012-12-31 
powershell -NoProfile -ExecutionPolicy Bypass -File garfield.ps1 %STARTDATE% %ENDDATE%