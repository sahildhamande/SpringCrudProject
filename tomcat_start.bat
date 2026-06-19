@echo off
set JAVA_HOME=C:\jdk-20
set JRE_HOME=C:\jdk-20
set CATALINA_HOME=D:\Spring-project\apache-tomcat-9.0.87
cd /d %CATALINA_HOME%\bin
call shutdown.bat
call startup.bat
