@echo off
title AICTE APAAR Platform - Satyam
echo ========================================================
echo   AICTE APAAR National Academic Identity Platform
echo ========================================================
echo.

cd /d "%~dp0"

:: Check if node is installed
where node >nul 2>nul
if errorlevel 1 (
    echo [ERROR] Node.js is not found in your PATH.
    echo Please install Node.js (v18 or higher) from https://nodejs.org/
    pause
    exit /b 1
)

:: Install dependencies if node_modules is missing
if not exist "node_modules" (
    echo [INFO] Dependencies not detected. Running npm install...
    call npm install
    if errorlevel 1 (
        echo [ERROR] npm install failed.
        pause
        exit /b 1
    )
)

echo [INFO] Starting Vite development server...
echo [INFO] Platform URL: http://localhost:5173/
echo.

:: Automatically open browser after 2 seconds in background
start "" cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:5173"

:: Start Vite dev server
call npm run dev

pause
