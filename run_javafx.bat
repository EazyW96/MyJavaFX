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
for %%F in (src\chpt\14\programs\*.java) do (
    if "%%~nF" neq "MyJavaFX" (
        echo Running %%~nF
        javac --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules=javafx.controls "%%F"
        java --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules=javafx.controls "%%~nF"
        pause
    )
)
goto start

:run_specific_program
cls
echo List of programs:
dir /b src\chpt\14\programs\*.java
set /p program="Enter the program name (without extension): "
javac --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules=javafx.controls "src\chpt\14\programs\%program%.java"
java --module-path "C:\Program Files\Java\javafx-sdk-22.0.1\lib" --add-modules=javafx.controls "src\chpt\14\programs\%program%"
pause
goto start
