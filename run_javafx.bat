@echo off

:start
cls
echo Choose an option:
echo 1. Run all programs
echo 2. Run a specific program
echo 3. Exit

set /p choice="Enter your choice: "

if %choice%==1 (
    call :run_all_programs
) else if %choice%==2 (
    call :run_specific_program
) else if %choice%==3 (
    exit
) else (
    echo Invalid choice. Please try again.
    pause
    goto start
)

:run_all_programs
if not exist bin mkdir bin
for %%F in (src\chpt\com\programs\*.java) do (
    if "%%~nF" neq "MyJavaFX" (
        echo Compiling %%~nF
        javac -d bin --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules javafx.controls "%%F"
    )
)
for %%F in (src\chpt\com\programs\*.java) do (
    if "%%~nF" neq "MyJavaFX" (
        echo Running %%~nF
        java -cp bin;"C:\Program Files\Java\javafx-sdk-22.0.1\lib\*" chpt.com.programs.%%~nF
        pause
    )
)
goto start

:run_specific_program
cls
echo List of programs:
if not exist src\chpt\com\programs (
    echo The directory src\chpt\com\programs does not exist.
    pause
    goto start
)
dir /b src\chpt\com\programs\*.java
set /p program="Enter the program name (without extension): "
if not exist src\chpt\com\programs\%program%.java (
    echo The specified program does not exist.
    pause
    goto start
)
if not exist bin mkdir bin
javac -d bin --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules javafx.controls "src\chpt\com\programs\%program%.java"
java -cp bin;"C:\Program Files\Java\javafx-sdk-22.0.1\lib\*" chpt.com.programs.%program%
pause
goto start
