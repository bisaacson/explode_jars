@REM Script to replace jar files with exploded directories

@REM The jar files will be located recursively in the JARPATH directory
@REM and all jar files will be replaced with exploded directories.
@REM The exploded directories will be named the same as the jar files.

@REM Requires 7-Zip


@REM 7-Zip path
set SEVENZIP="C:\Program Files\7-Zip\7z.exe"

@REM Path to the directory containing the jar files
set JARPATH=C:\path\to\target-dir


@REM Find all jar files in the JARPATH directory
for /f "delims=" %%a in ('dir /b /s /a-d %JARPATH%\*.jar') do (
    @REM Extract the jar file to ~dpn (d=drive p=path n=name w/o extension)
    %SEVENZIP% x %%a -y -o%%~dpna

    @REM Delete the jar file
    del %%a
    
    @REM Rename the extracted directory to the same name as the jar file
    ren %%~dpna %%~nxa
)

@REM End of script
pause
