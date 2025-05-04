::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpTQxeWNWWyCYk47fvw++WXnmwNRN42dpzP27iCH+kQ5UuqfJUitg==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpTQxeWNWWyCYk47fvw++WXnmwNRN4+aJ/n07qdNOEf5gvhbZNN
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
cd /d "%~dp0"

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    :: Python not found, show pop-up message and run installer
    echo Running the PowerShell script to install Python 3.1.13...
    powershell -Command "Start-Process '%~dp0files\py\InstallPython.exe' -ArgumentList 'InstallAllUsers=1 PrependPath=1 Include_test=0 /quiet' -Verb RunAs -Wait"
    powershell -Command "Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.MessageBox]::Show('Already installed. Please ensure all required prerequisites are properly installed by wait creation and executing setup.exe before running the app.')"
    exit /b
)

:continue
:: Python is installed — show a message box using PowerShell
powershell -Command "Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.MessageBox]::Show('Python is already installed. Please ensure all required prerequisites are properly installed by wait creation and executing setup.exe before running the app.')"
attrib -h "setup.exe"
exit /b
pause
