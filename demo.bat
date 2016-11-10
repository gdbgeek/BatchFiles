@echo off


REM ***************************************
REM Get Home Directory
REM ***************************************
SET homedir="%cd%"
echo .
echo ######################################
echo Home Directory is %homedir%
echo ######################################
echo .

cd %homedir%

REM ***************************************
REM Get JAR file name
REM ***************************************
for %%x in (*.jar) do if not defined jarFile set jarFile=%%x
echo ######################################
echo JAR File is %jarFile%
echo ######################################

FOR %%? IN (%jarFile%) DO (
	ECHO File Name Only       : %%~n?
	ECHO File Extension       : %%~x?
	REM ECHO Name in 8.3 notation : %%~sn?
	REM ECHO File Attributes      : %%~a?
	REM ECHO Located on Drive     : %%~d?
	ECHO File Size            : %%~z?
	ECHO Last-Modified Date   : %%~t?
	REM ECHO Parent Folder        : %%~dp?
	REM ECHO Fully Qualified Path : %%~f?
	REM ECHO FQP in 8.3 notation  : %%~sf?
)
echo .

REM ***************************************
REM Go up one directory
REM ***************************************
cd ..

REM ***************************************
REM Get project file
REM ***************************************
for %%x in (*.b4j) do if not defined b4jFile set b4jFile=%%x

echo ######################################
echo B4J File is %b4jFile%
echo ######################################

FOR %%? IN (%b4jFile%) DO (
	ECHO File Name Only       : %%~n?
	ECHO File Extension       : %%~x?
	REM ECHO Name in 8.3 notation : %%~sn?
	REM ECHO File Attributes      : %%~a?
	REM ECHO Located on Drive     : %%~d?
	ECHO File Size            : %%~z?
	ECHO Last-Modified Date   : %%~t?
	REM ECHO Parent Folder        : %%~dp?
	REM ECHO Fully Qualified Path : %%~f?
	REM ECHO FQP in 8.3 notation  : %%~sf?
)
echo .

REM ***************************************
REM Just get the project name
REM ***************************************
for /R %%x in (*.b4j) do set b4jFile=%%~nx

REM ***************************************
REM Make a directory somewhere
REM ***************************************
IF NOT EXIST C:\Dropbox\Public\JARS\%b4jFile% mkdir C:\Dropbox\Public\JARS\%b4jFile%

REM ***************************************
REM Go back to home
REM ***************************************
cd %homedir%

REM ***************************************
REM Copy the JAR file to our directory
REM ***************************************
copy %jarFile% C:\Dropbox\Public\JARS\%b4jFile%\%jarFile% /Y >nul 2>&1

EXIT /B 1

