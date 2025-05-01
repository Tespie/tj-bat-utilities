
@REM  * This script generates markdown files for each day of a specified month and year,
@REM  * Including weekends (Saturday and Sunday).
@REM  * It uses a template file to create new files with the date in the filename.
@REM  * The script is designed to be run in a Windows environment.

@echo off
setlocal enabledelayedexpansion

rem Template file name
set "template=new_5_comments_template.md"

rem Check if template file exists
if not exist "%template%" (
    echo Template file "%template%" not found!
    pause
    exit /b 1
)

rem Year and month to process
set "year=2025"
set "month=5"

rem Days in May 2025 (31 days)
set "days=31"

rem Loop through all days of May 2025
for /L %%d in (1,1,%days%) do (
    rem Format day with leading zero for date calculation (yyyy-mm-dd)
    if %%d LSS 10 (
        set "day=0%%d"
    ) else (
        set "day=%%d"
    )

    rem Use PowerShell to get the day of week for the date
    for /f %%w in ('powershell -command "(Get-Date '%year%-%month%-%day%').DayOfWeek.value__"') do (
        set "dow=%%w"
    )

    rem DayOfWeek value: Sunday=0, Monday=1, ..., Saturday=6
    rem We want to exclude Saturday(6) and Sunday(0)
    if not "!dow!"=="0" if not "!dow!"=="6" (
        rem Format file name like 7_may_2025.md
        set "filename=%%d_may_2025.md"
        rem Copy template to new file
        copy /Y "%template%" "!filename!" >nul
        echo Created !filename!
    )
)

echo All files created successfully.
pause
