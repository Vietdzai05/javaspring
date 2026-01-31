@echo off
cd /d "%~dp0"
echo.
echo ===== STARTING BAITAP6 APPLICATION =====
echo.

REM Check if Maven is available
where mvn >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo Building and running with Maven...
    mvn clean spring-boot:run
) else (
    echo Maven not found. Please use IntelliJ IDEA to run:
    echo 1. Open IntelliJ IDEA
    echo 2. Open folder: baitap6
    echo 3. Find Main.java
    echo 4. Right-click -^> Run 'Main.main()'
    echo 5. Browser: http://localhost:8080/employees/list
)

pause
