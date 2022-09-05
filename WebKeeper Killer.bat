@echo off
title "WebKeeper 무력화 프로그램"
color 17
chcp 65001

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if '%errorlevel%' NEQ '0' (
	echo "스크립트를 관리자 권한으로 다시 실행 중..."
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

echo "WebKeeper 무력화 프로그램"
echo "Made by cyberls17"
echo.

ICACLS "C:\Program Files (x86)\WebKeeper" /deny user:F

echo "WebKeeper가 무력화되었습니다."
echo "로그오프 후 다시 로그인해주세요."
echo "아무 키나 누르면 로그오프 됩니다."
pause >null
logoff