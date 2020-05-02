set WEBGOAT_SCRIPTS=%cd%
set WEBGOAT_HOME=%cd%\..
set JAVA_HOME=C:\Program Files\Java\jdk-11.0.6

nc -zv 127.0.0.1 8080
echo %errorlevel%
if %ERRORLEVEL% ==  0 (
    echo "Error: %errorlevel%: WebGoat is still running on 8080 - please stop that!"
    goto :eof
    )

nc -zv 127.0.0.1 9090
if %ERRORLEVEL% ==  0 (
   echo "Error: %errorlevel%: WebWolf is still running on 8080 - please stop that!"
    goto :eof
    )

cd %WEBGOAT_HOME%
start mvnw clean install -DskipTests
if not errorlevel 0 (
  goto :eof
)

cd %WEBGOAT_SCRIPTS%
build_docker.bat
if errorlevel NEQ 0 (
    echo "Build failure...."
    goto :eof
    )

SET /P runDockerCompose="Do you want to run docker-compose?"(Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" goto :eof
clean-run-docker-compose.bat

:eof
cd %WEBGOAT_SCRIPTS%

@echo on
