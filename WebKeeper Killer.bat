@echo off
title WebKeeper ����ȭ ���α׷�
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

echo WebKeeper ����ȭ ���α׷�
echo Made by cyberls17
echo.

ICACLS "C:\Program Files (x86)\WebKeeper" /deny user:F

echo WebKeeper�� ����ȭ�Ǿ����ϴ�.
echo �α׿��� �� �ٽ� �α������ּ���.
echo �ƹ� Ű�� ������ �α׿��� �˴ϴ�.
pause >nul
logoff