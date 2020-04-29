rem A Windoze copy of ./build_docker.sh
@echo off
set WEBGOAT_SCRIPTS=%cd%
set WEBGOAT_HOME=%cd%\..

cd %WEBGOAT_HOME%\webgoat-server
docker build -t webgoat/webgoat-v8.0.0.snapshot .

cd %WEBGOAT_HOME%\webwolf
docker build -t webgoat/webwolf-v8.0.0.snapshot .

cd %WEBGOAT_SCRIPTS%

@echo off
