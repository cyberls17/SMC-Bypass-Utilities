@echo off
title ClassM Killer
color 17

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
	echo ��ũ��Ʈ�� ������ �������� �ٽ� ���� ��...
	goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
     echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
     echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
     exit /B

:gotAdmin
     if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
     pushd "%CD%"
     CD /D "%~dp0"

echo ClassM_Client ����ȭ ���α׷�
echo.
sc delete ClassM_Client_Service
taskkill /F /IM ClassM_Client_Service.exe /T
taskkill /F /IM ClassM_Client.exe /T

echo ClassM_Client �� ClassM_Client_Service�� ����Ǿ����ϴ�.
pause