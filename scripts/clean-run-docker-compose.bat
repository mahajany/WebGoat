@echo off
set WEBGOAT_SCRIPTS=%cd%
set WEBGOAT_HOME=%cd%\..

cd %WEBGOAT_HOME%
docker-compose rm -f
docker-compose -f docker-compose-local.yml up

cd %WEBGOAT_SCRIPTS%
@echo on
