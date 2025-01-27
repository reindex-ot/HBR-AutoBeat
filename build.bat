@echo off
set SCRIPT_NAME=main.py
set OUTPUT_NAME=HBR-AutoBeat
set ICON_FILE=icon/favicon.ico

pip show pyinstaller >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing PyInstaller...
    pip install pyinstaller
)

echo Packaging %SCRIPT_NAME% as %OUTPUT_NAME%.exe...
pyinstaller --onefile --noconsole --name=%OUTPUT_NAME% --icon=%ICON_FILE% %SCRIPT_NAME%

if %errorlevel% neq 0 (
    echo error!
    pause
    exit /b %errorlevel%
)

echo Clearning tmp files...
rmdir /s /q build
del %SCRIPT_NAME:.py=.spec%

echo Success!
pause
