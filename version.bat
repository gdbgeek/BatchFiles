@echo off

set homdir=%CD%

REM ####################################################
REM If the version file doesnt exist, create it
REM ####################################################
IF NOT EXIST version.txt echo 0.0 > version.txt

setlocal EnableDelayedExpansion
set decimals=1
set /A one=1, decimalsP1=decimals+1

for /L %%i in (1,1,%decimals%) do set "one=!one!0"

for /f %%x in (version.txt) do (set numA=%%x)

echo Current Version = %numA%

REM ####################################################
REM Remove leading zeroes (if any)
REM ####################################################
for /f "tokens=* delims=0" %%N in ("%numA%") do set "numA=%%N"
if not defined numA set "numA=0"

REM ####################################################
REM Now expand the number by the number of decimals
REM ####################################################
set "fpA=%numA:.=%"

REM ####################################################
REM Increment the version
REM ####################################################
set /a fpA=%fpA%+1

REM ####################################################
REM Now decrease the number by the number of decimals
REM ####################################################
set numA=!fpA:~0,-%decimals%!.!fpA:~-%decimals%!

REM ####################################################
REM Check if it needs a leading zero
REM ####################################################
IF %numA:~0,1%==. set numA=0%numA%

echo New Version = %numA%

echo %numA%> version.txt

