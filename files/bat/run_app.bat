::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpTQxeWNWWyCYk47fvw++WXnmwNRN4+aJ/n07eBLvMv+FDqSp8u2XQUkcgDbA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdFy5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJgZksaHErTXA==
::ZQ05rAF9IBncCkqN+0xwdVsEAlTMbCXrZg==
::ZQ05rAF9IAHYFVzEqQI2IQlHWBCQJQs=
::eg0/rx1wNQPfEVWB+kM9LVsJDAKLLniuEqcFiA==
::fBEirQZwNQPfEVWB+kM9LVsJDAKLLniuEqcFiA==
::cRolqwZ3JBvQF1fEqQI2IQlHWBCQJQs=
::dhA7uBVwLU+EWF+N5lEkPAlNLA==
::YQ03rBFzNR3SWATE8ksiOw9AXh3i
::dhAmsQZ3MwfNWATE8ksiOw9AXh3i
::ZQ0/vhVqMQ3MEVWAtB9wLhJGXxCWLnLa
::Zg8zqx1/OA3MEVWAtB9wLhJGXxCWLnLa
::dhA7pRFwIByZRRmC/VAjPA9GVWQ=
::Zh4grVQjdCyDJGyX8VAjFDpTQxeWNWWyCYk47fvw++WXnmwNRN4+aJ/n26SebuUL7yU=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
set STREAMLIT_DISABLE_USAGE_STATS=true
cd /d "%~dp0"

:: Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    :: Python not found, show pop-up message using PowerShell
    powershell -Command "Add-Type -AssemblyName 'System.Windows.Forms'; [System.Windows.Forms.MessageBox]::Show('Python not detected. Please ensure all required prerequisites are properly installed by first executing install.exe, followed by setup.exe, before run app proceeding.')"
    exit /b
)
:: If Python is found, run Streamlit
python -m streamlit run "%~dp0files\py\app.py"
pause
