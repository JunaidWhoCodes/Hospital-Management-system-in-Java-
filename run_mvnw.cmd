@echo off
REM Helper to set JAVA_HOME for this session and call the Maven wrapper using cmd parsing
SET "JAVA_CMD=%~dp0\..\..\..\..\Program Files\Java\jdk-24"
REM Auto-detect java if available
for /f "usebackq tokens=*" %%i in (`where java 2^>nul`) do set "JAVA_EXE=%%i" & goto :foundJava
goto :noJava
:foundJava
for %%I in ("%JAVA_EXE%") do set "JAVA_DIR=%%~dpI"
REM JAVA_DIR ends with \bin\, so strip trailing \bin\
set "JAVA_HOME=%JAVA_DIR:~0,-4%"
echo Using JAVA_HOME=%JAVA_HOME%
if exist "%JAVA_HOME%\bin\java.exe" (
  set "JAVA_HOME=%JAVA_HOME%"
) else (
  echo Java not found at %JAVA_HOME%
)
call "%~dp0mvnw.cmd" clean javafx:run
exit /b %ERRORLEVEL%
:noJava
echo java.exe not found on PATH. Please install JDK or add java to PATH.
exit /b 1