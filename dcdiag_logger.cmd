@echo off
For /f "tokens=1-3 delims=." %%a in ('date /t') do (set mydate=%%a-%%b-%%c)
For /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a%%b)
echo %mydate%_%mytime%
dcdiag /c /e /v > .\dcdiag_logs\dcdiag_%mydate%_%mytime%.log